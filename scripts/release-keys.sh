#!/usr/bin/env bash
# Release the homework and lab keys whose time has passed, and optionally deploy the site.
#
# The keys live in the private hw-solutions repository, each with its frozen results (_freeze/).
# For every key whose release time (scripts/release-keys.conf names the table) has passed, this
# copies the key and its frozen results into the site, renders the page with the site's theme
# using only the frozen results (no Julia), and leaves it in _site/solutions/<folder>/.
# Nothing is committed. The deploy Action runs this on every push and every evening; the
# "Key Release Workflow" note in the course vault describes the whole process.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/release-keys.sh --keys DIR [options]

  --keys DIR          checkout of the private hw-solutions repository
  --now "YYYY-MM-DD HH:MM"
                      pretend it is this US Eastern time (rehearsals)
  --dry-run           list released and pending keys; change nothing
  --only-if-new       do nothing unless a key came due in the last 25 hours
  --in-place          work in this checkout (the deploy Action does); by default a
                      temporary copy of the committed site is used, so your checkout
                      and its _site are never touched
  --serve             after building, serve the result at http://localhost:4400 so you can
                      look at it (with --now, this is how to preview a release); Ctrl-C stops
  --deploy            deploy the result to Cloudflare Pages (needs CLOUDFLARE_API_TOKEN
                      and CLOUDFLARE_ACCOUNT_ID in the environment); never combine with a
                      future --now, which would publish keys early
  --branch NAME       Pages branch to deploy to (default main)
EOF
}

SITE_ROOT=$(cd "$(dirname "$0")/.." && pwd)
# shellcheck source=release-keys.conf
. "$SITE_ROOT/scripts/release-keys.conf"   # TABLE, PROJECT, RENDER_ARGS, COPY_EXTENSIONS

KEYS="" NOW="" DRY=no ONLY_NEW=no IN_PLACE=no DEPLOY=no SERVE=no BRANCH=main
while [ $# -gt 0 ]; do
  case "$1" in
    --keys) KEYS=$2; shift 2 ;;
    --now) NOW=$2; shift 2 ;;
    --dry-run) DRY=yes; shift ;;
    --only-if-new) ONLY_NEW=yes; shift ;;
    --in-place) IN_PLACE=yes; shift ;;
    --deploy) DEPLOY=yes; shift ;;
    --serve) SERVE=yes; shift ;;
    --branch) BRANCH=$2; shift 2 ;;
    -h | --help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

in_ci() { [ "${GITHUB_ACTIONS:-}" = true ]; }
if [ "$DEPLOY" = yes ] && [ -n "$NOW" ]; then
  echo "--deploy with --now would publish keys before their time; rehearse without --deploy." >&2
  exit 2
fi
fail() { if in_ci; then echo "::error::$*"; else echo "error: $*" >&2; fi; }

# --- which keys are released ------------------------------------------------------------------
list_args=("$SITE_ROOT/$TABLE")
[ -n "$NOW" ] && list_args+=(--now "$NOW")
LIST=$(python3 "$SITE_ROOT/scripts/key_releases.py" "${list_args[@]}")

if [ "$DRY" = yes ]; then
  printf '%-9s %-7s %-7s %-17s %s\n' status id folder "release (ET)" ""
  printf '%s\n' "$LIST" | awk -F'\t' '{ printf "%-9s %-7s %-7s %-17s %s\n", $1, $2, $3, $4, $5 }'
  exit 0
fi

if [ "$ONLY_NEW" = yes ] && ! printf '%s\n' "$LIST" | grep -q $'\tnew$'; then
  echo "No key came due in the last 25 hours; nothing to deploy."
  exit 0
fi

[ -n "$KEYS" ] || { usage >&2; exit 2; }
KEYS=$(cd "$KEYS" && pwd)

# --- where to work ----------------------------------------------------------------------------
if [ "$IN_PLACE" = yes ]; then
  WORK=$SITE_ROOT
else
  scratch=$(mktemp -d "${TMPDIR:-/tmp}/release-keys.XXXXXX")
  trap 'rm -rf "$scratch"' EXIT
  WORK=$scratch/site
  git clone -q --local "$SITE_ROOT" "$WORK"
  echo "Working in a temporary copy of the committed site ($WORK)."
fi

# --- release ----------------------------------------------------------------------------------
md5_of() { python3 -c 'import hashlib,sys; print(hashlib.md5(open(sys.argv[1],"rb").read()).hexdigest())' "$1"; }

failed="" released=0
while IFS=$'\t' read -r status id folder release _new; do
  [ "$status" = released ] || continue
  src=$KEYS/$folder
  frozen=$KEYS/_freeze/$folder
  if [ ! -d "$src" ]; then
    fail "$id: $folder/ is not in hw-solutions"; failed="$failed $id"; continue
  fi
  set -- "$src"/*.qmd
  if [ $# -ne 1 ] || [ ! -f "$1" ]; then
    fail "$id: $folder/ must hold exactly one .qmd"; failed="$failed $id"; continue
  fi
  name=$(basename "$1" .qmd)
  # Frozen results record the hash of the source they came from; a mismatch means the key was
  # edited after its last render, and Quarto would try to run Julia, which the Action doesn't have.
  results=$frozen/$name/execute-results
  if [ ! -d "$results" ]; then
    fail "$id: no frozen results ($folder/$name.qmd has not been rendered in hw-solutions)"
    failed="$failed $id"; continue
  fi
  want=$(md5_of "$src/$name.qmd")
  stale=no
  for json in "$results"/*.json; do
    got=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["hash"])' "$json")
    [ "$got" = "$want" ] || stale=yes
  done
  if [ "$stale" = yes ]; then
    fail "$id: $folder/$name.qmd changed after its last render; render it in hw-solutions and push"
    failed="$failed $id"; continue
  fi

  rm -rf "$WORK/solutions/$folder" "$WORK/_freeze/solutions/$folder" "$WORK/_site/solutions/$folder"
  mkdir -p "$WORK/solutions" "$WORK/_freeze/solutions"
  cp -R "$src" "$WORK/solutions/$folder"
  cp -R "$frozen" "$WORK/_freeze/solutions/$folder"
  log=$(mktemp)
  # RENDER_ARGS is a list of words from the conf file
  # shellcheck disable=SC2086
  if (cd "$WORK" && quarto render "solutions/$folder/$name.qmd" --use-freezer $RENDER_ARGS) >"$log" 2>&1 &&
    [ -f "$WORK/_site/solutions/$folder/$name.html" ]; then
    for ext in $COPY_EXTENSIONS; do
      if [ -f "$src/$name.$ext" ]; then
        cp "$src/$name.$ext" "$WORK/_site/solutions/$folder/"
      else
        fail "$id: $folder/$name.$ext is missing from hw-solutions"; failed="$failed $id"
      fi
    done
    echo "released $id ($release ET) -> solutions/$folder/$name.html"
    released=$((released + 1))
  else
    # The render log can quote the key, and Action logs on a public repository are public,
    # so it is printed only on your own machine.
    fail "$id: rendering solutions/$folder/$name.qmd failed"
    in_ci || tail -25 "$log" >&2
    rm -rf "$WORK/_site/solutions/$folder"
    failed="$failed $id"
  fi
  rm -f "$log"
done <<EOF
$LIST
EOF

echo "$released key(s) released.${failed:+ Failed:$failed}"

# --- deploy -----------------------------------------------------------------------------------
if [ "$DEPLOY" = yes ]; then
  : "${CLOUDFLARE_API_TOKEN:?set CLOUDFLARE_API_TOKEN to deploy}"
  : "${CLOUDFLARE_ACCOUNT_ID:?set CLOUDFLARE_ACCOUNT_ID to deploy}"
  npx --yes wrangler@4 pages deploy "$WORK/_site" --project-name "$PROJECT" --branch "$BRANCH" \
    --commit-dirty=true
fi

if [ "$SERVE" = yes ]; then
  echo "Serving $WORK/_site at http://localhost:4400 (Ctrl-C to stop)."
  (cd "$WORK/_site" && python3 -m http.server 4400 --bind 127.0.0.1) || true
fi

[ -z "$failed" ]
