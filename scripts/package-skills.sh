#!/usr/bin/env bash
# Builds uploadable skill packages for claude.ai account skills.
#
#   ./scripts/package-skills.sh
#
# Produces two things in dist/:
#
#   soloagency.zip        one upload, the whole pack. The front desk is the
#                         skill; the other 21 ride along as reference files.
#                         This is the one you want.
#
#   individual/*.zip      one zip per skill, if you would rather upload only
#                         some of them.
#
# The uploader requires: everything inside a single top-level folder, exactly
# one SKILL.md, and no plugin manifest. All three are handled here.
set -euo pipefail
cd "$(dirname "$0")/.."

OUT="dist"
rm -rf "$OUT"; mkdir -p "$OUT/individual"

# ---- the bundle -------------------------------------------------------------
B="$OUT/.build/soloagency"
mkdir -p "$B/lanes" "$B/references"

cp skills/soloagency/SKILL.md "$B/SKILL.md"
cp references/CONTRACT.md references/MEMORY.md references/TUNING.md "$B/references/"

for d in skills/*/; do
  n=$(basename "$d")
  [[ "$n" == "soloagency" ]] && continue
  cp "$d/SKILL.md" "$B/lanes/$n.md"
done

count=$(ls -1 "$B/lanes" | wc -l | tr -d ' ')

# The desk needs to know it is in a bundle and where the others live.
python3 - "$B/SKILL.md" "$count" <<'PY'
import sys,re
p,count=sys.argv[1],sys.argv[2]
s=open(p).read()
note=f"""
## Read the lane before you route to it

This upload carries the whole pack. The other {count} skills are files in
`lanes/`, named after the skill: `lanes/solo-pricing.md`,
`lanes/solo-validate.md`. Shared rules in `references/CONTRACT.md`, the
notebook in `references/MEMORY.md`. List `lanes/` rather than guessing a name.

**A lane you have not opened is a name, not a skill.** You can produce a
confident routing answer from the table below without reading anything, and it
will look exactly like real routing. It is not. Open the file for every lane
you are going to use, and read only those.

When you report, list the files you actually opened. If you named a lane and
did not open it, say so in the same breath. That one sentence is the difference
between this working and this being an impression of itself.

"""
s=s.replace("## First move, always", note+"## First move, always",1)
open(p,'w').write(s)
PY

( cd "$OUT/.build" && zip -qr "../soloagency.zip" soloagency )

# ---- individual -------------------------------------------------------------
for d in skills/*/; do
  n=$(basename "$d")
  t="$OUT/.build/single/$n"
  mkdir -p "$t"
  cp "$d/SKILL.md" "$t/SKILL.md"
  ( cd "$OUT/.build/single" && zip -qr "../../individual/$n.zip" "$n" )
done

rm -rf "$OUT/.build"

# ---- check what we built ----------------------------------------------------
fail=0
check(){
  local z="$1"
  local roots skillmds manifest
  roots=$(unzip -Z1 "$z" | cut -d/ -f1 | sort -u | wc -l | tr -d ' ')
  skillmds=$(unzip -Z1 "$z" | grep -c 'SKILL\.md$' || true)
  manifest=$(unzip -Z1 "$z" | grep -c 'plugin\.json$' || true)
  [[ "$roots" == "1" ]]    || { echo "  FAIL $z: $roots top-level entries, need 1"; fail=1; }
  [[ "$skillmds" == "1" ]] || { echo "  FAIL $z: $skillmds SKILL.md files, need exactly 1"; fail=1; }
  [[ "$manifest" == "0" ]] || { echo "  FAIL $z: contains a plugin manifest"; fail=1; }
}
check "$OUT/soloagency.zip"
for z in "$OUT"/individual/*.zip; do check "$z"; done

echo
if [[ $fail -eq 0 ]]; then
  echo "Built $OUT/soloagency.zip ($(ls -1 "$OUT/individual" | wc -l | tr -d ' ') individual zips too)."
  echo "Every zip: one top-level folder, exactly one SKILL.md, no plugin manifest."
  echo
  echo "Upload dist/soloagency.zip at claude.ai: Customize, Skills, +, Create skill, Upload a skill."
else
  echo "FAILED. See above."
fi
exit $fail
