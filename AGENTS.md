# BEE 4750/5750 Course Website — Agent Guide

## Toolchain

- **Quarto** (v1.10+) builds the site. Julia is the execution engine:
  - `quarto preview` — dev server on port 4200
  - `quarto render` — build to `_site/`
  - `engine: julia` with `exeflags: ["+1.12"]` in `_quarto.yml`
- **No** Makefile, CI workflows, linters, type checkers, or test framework.
- **gh-pages** branch exists for deployment; no deploy automation in this repo.

## Julia Environments (multi-environment)

Quarto activates the **closest** `Project.toml` when rendering a file:

| Directory | Contents |
|-----------|----------|
| Root (`Project.toml`) | Minimal – Animations, CSV, DataFrames, Distributions, JuMP, Latexify, PrettyTables, StatsBase |
| `slides/` | Heavy – adds DifferentialEquations, Plots, HiGHS, Metaheuristics, Optim, GlobalSensitivity, etc. |
| `tutorials/` | Adds Turing, CairoMakie, PythonPlot, CondaPkg, etc. |
| `solutions/hw*/` | Each has its own environment |
| `hw/hw*/` (submodules) | Each has its own environment |

Run Julia from the relevant directory to activate the right env. The VS Code setting `julia.environmentPath` points to the repo root.

## Structure

- **`_quarto.yml`** — site config, nav, sidebar, format settings (HTML, Typst, RevealJS, Beamer)
- **`_variables.yml`** — reusable variables (course number, instructor, etc.) referenced via `{{< var ... >}}`
- **`_assets/`** — logos, Lua filters, Typst build helpers, CSL
- **`_extensions/quarto-ext/fontawesome/`** — Quarto extension for icons
- **`data/schedule.csv`** — course schedule data
- **`sass/`** — SCSS overrides for the Simplex theme and RevealJS
- **`slides/`** — lecture slides (`.qmd` with RevealJS format)
- **`tutorials/`** — tutorial `.qmd`s with their own Julia env
- **`solutions/hw01-03/`** — solution notebooks (not submodules)

## Submodules

Homework repos are **git submodules** (not checked out by default; `git submodule update --init` needed):

| Path | Remote | Branch |
|------|--------|--------|
| `hw/hw01` | `BEE4750/hw01` | `Fall26` |
| `hw/hw02`–`hw05` | `bee-envsys-cornell/hw02`–`hw05` | `Fall25` |
| `labs/lab01`–`lab02` | `bee-envsys-cornell/lab01`–`lab02` | `Fall25` |

`labs/lab03` is **not** a submodule — content lives directly in this repo.

## Render Quirks

- `freeze: auto` in `_quarto.yml` caches computed outputs in `_freeze/`. Delete `_freeze/` or touch a source file to force re-render.
- `solutions/hw*` files will **not render** without their respective Julia environments activated and dependencies installed.

## Branches

- `main` — current development (Fall 2026 updates)
- `Fall25` — previous year (origin only, not merged)
- `gh-pages` — built site deployment
