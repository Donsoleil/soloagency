#!/usr/bin/env bash
# install-soloagency.sh
# Fans soloagency (59 skills) out to every local agent skill root.
#
# Usage:
#   ./install-soloagency.sh /path/to/soloagency-main.zip
#   ./install-soloagency.sh /path/to/soloagency-main   # already unzipped
#
# Flags:
#   --copy      copy files instead of symlinking (default is symlink)
#   --prefix X  prefix every installed skill dir with X- (e.g. sf-) to avoid name collisions
#   --dry-run   print what would happen, change nothing
#
# One canonical source lives at ~/.agents/sources/soloagency.
# Every root gets a symlink per skill, so updating the source updates all roots at once.

set -euo pipefail

SRC_INPUT="${1:-}"
MODE="symlink"
PREFIX=""
DRY=0

shift || true
while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE="copy"; shift ;;
    --prefix) PREFIX="$2-"; shift 2 ;;
    --dry-run) DRY=1; shift ;;
    *) echo "unknown flag: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$SRC_INPUT" ]]; then
  echo "usage: $0 <zip-or-dir> [--copy] [--prefix sf] [--dry-run]" >&2
  exit 1
fi

CANON="$HOME/.agents/sources/soloagency"

run() { if [[ $DRY -eq 1 ]]; then echo "  would: $*"; else "$@"; fi }

# ---- 1. stage the canonical source -----------------------------------------
if [[ "$SRC_INPUT" == *.zip ]]; then
  TMP="$(mktemp -d)"
  unzip -q "$SRC_INPUT" -d "$TMP"
  SRC="$(find "$TMP" -maxdepth 2 -type d -name skills | head -1 | xargs dirname)"
else
  SRC="$SRC_INPUT"
fi

if [[ ! -d "$SRC/skills" ]]; then
  echo "no skills/ directory found under $SRC" >&2
  exit 1
fi

echo "source: $SRC"
echo "canonical: $CANON"
run mkdir -p "$(dirname "$CANON")"
run rm -rf "$CANON"
run cp -R "$SRC" "$CANON"

# glob over the real source so --dry-run reports truthfully,
# but link to the canonical path that will exist after a real run
SRC_SKILLS="$SRC/skills"
CANON_SKILLS="$CANON/skills"
COUNT=$(ls -1 "$SRC/skills" | wc -l | tr -d ' ')
echo "skills found: $COUNT"
echo

# ---- 2. find the roots ------------------------------------------------------
# Known roots first, then auto-detect anything that looks like an agent skill dir.
CANDIDATES=(
  "$HOME/.claude/skills"          # Claude Code
  "$HOME/.agents/skills"          # Goose / sq-agents shared root
  "$HOME/.codex/skills"           # Codex
  "$HOME/.config/opencode/skills" # OpenCode
  "$HOME/.opencode/skills"        # OpenCode (alt)
  "$HOME/.berd/skills"            # Berd
  "$HOME/.cursor/skills"          # Cursor
  "$HOME/.nexus/skills"           # Nexus
  "$HOME/.firebender/skills"      # Firebender
  "$HOME/Library/Application Support/xyz.block.berd/skills"  # Berd
)

ROOTS=()
for c in "${CANDIDATES[@]}"; do
  parent="$(dirname "$c")"
  # only install into a tool that actually exists on this machine
  if [[ -d "$c" || -d "$parent" ]]; then
    ROOTS+=("$c")
  fi
done

if [[ ${#ROOTS[@]} -eq 0 ]]; then
  echo "no agent config dirs found under \$HOME. Nothing to install into." >&2
  exit 1
fi

echo "targets:"
printf '  %s\n' "${ROOTS[@]}"
echo

# ---- 3. install -------------------------------------------------------------
for root in "${ROOTS[@]}"; do
  run mkdir -p "$root"
  installed=0
  skipped=0
  for skill_path in "$SRC_SKILLS"/*/; do
    name="$(basename "$skill_path")"
    dest="$root/${PREFIX}${name}"
    target="$CANON_SKILLS/$name"

    # never clobber a real directory you wrote yourself
    if [[ -d "$dest" && ! -L "$dest" ]]; then
      echo "  SKIP $dest (existing real directory, not a link from this script)"
      skipped=$((skipped+1))
      continue
    fi
    run rm -f "$dest"
    if [[ "$MODE" == "symlink" ]]; then
      run ln -s "$target" "$dest"
    else
      run cp -R "${skill_path%/}" "$dest"
    fi
    installed=$((installed+1))
  done
  echo "$root: $installed installed, $skipped skipped"
done

echo
echo "done. To update later: re-run with the new zip, links pick it up automatically."
echo "To uninstall: find the roots above and remove links pointing into $CANON"
