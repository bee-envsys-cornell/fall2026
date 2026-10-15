#!/usr/bin/env python3
"""List which keys are released, from the site's release table.

Prints one tab-separated line per key: status (released/pending), id, folder, release time
(US Eastern wall clock, YYYY-MM-DDTHH:MM) and whether the release is new (came due within the
window before now). Used by release-keys.sh; run it on its own to check a table.

Two table shapes are read, told apart by their header:
- data/key-releases.csv: id,folder,release  (release = "YYYY-MM-DD HH:MM", Eastern)
- data/assessments.csv:  rows whose `solution` cell is set (solutions/<folder>/<file>); the
  release is the `key` date at KEY_TIME Eastern, when the late window closes.
"""
import argparse
import csv
import sys
from datetime import datetime, timedelta
from zoneinfo import ZoneInfo

EASTERN = ZoneInfo("America/New_York")
KEY_TIME = "21:00"


def parse_eastern(text):
    text = text.strip().replace("T", " ")
    return datetime.strptime(text, "%Y-%m-%d %H:%M").replace(tzinfo=EASTERN)


def read_table(path):
    with open(path, newline="") as f:
        rows = list(csv.DictReader(f))
    if not rows:
        return []
    keys = []
    if "release" in rows[0]:
        for r in rows:
            keys.append((r["id"].strip(), r["folder"].strip(), parse_eastern(r["release"])))
    elif "solution" in rows[0] and "key" in rows[0]:
        for r in rows:
            solution = (r.get("solution") or "").strip()
            if not solution or solution.startswith("http"):
                continue
            parts = solution.split("/")
            if len(parts) < 3 or parts[0] != "solutions":
                sys.exit(f"{r['id']}: solution must look like solutions/<folder>/<file>, got {solution!r}")
            if not (r.get("key") or "").strip():
                sys.exit(f"{r['id']}: solution is set but key (the release date) is empty")
            keys.append((r["id"].strip(), parts[1], parse_eastern(f"{r['key'].strip()} {KEY_TIME}")))
    else:
        sys.exit(f"{path}: expected columns id,folder,release or an assessments table with key,solution")
    return keys


def main():
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("table")
    p.add_argument("--now", help="Eastern wall time to use instead of the clock, YYYY-MM-DD HH:MM")
    p.add_argument("--window-hours", type=float, default=25,
                   help="a release this recent counts as new (default 25)")
    a = p.parse_args()
    now = parse_eastern(a.now) if a.now else datetime.now(EASTERN)
    window = timedelta(hours=a.window_hours)
    for key_id, folder, release in sorted(read_table(a.table), key=lambda k: k[2]):
        released = release <= now
        new = released and now - release < window
        print("\t".join([
            "released" if released else "pending", key_id, folder,
            release.strftime("%Y-%m-%dT%H:%M"), "new" if new else "",
        ]))


if __name__ == "__main__":
    main()
