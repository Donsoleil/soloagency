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

# ---- the project package ----------------------------------------------------
# For Claude Projects, which reach the phone app where skills do not.
P="$OUT/project"
mkdir -p "$P/knowledge"

for d in skills/*/; do
  n=$(basename "$d")
  [[ "$n" == "soloagency" ]] && continue
  cp "$d/SKILL.md" "$P/knowledge/$n.md"
done
cp references/CONTRACT.md "$P/knowledge/how-these-work.md"
cp references/MEMORY.md   "$P/knowledge/the-notebook.md"

python3 - "skills/soloagency/SKILL.md" "$P/INSTRUCTIONS.md" <<'PY2'
import sys
desk=open(sys.argv[1]).read()
body=desk.split('---',2)[2].strip()
out=f"""Paste everything below the line into your project's custom instructions.
Upload every file from the knowledge folder into the project's knowledge.

------------------------------------------------------------------------

{body}

## You are running as a project

The lanes are files in this project's knowledge, named after the skill:
`solo-pricing.md`, `solo-validate.md`, and so on. The shared rules are in
`how-these-work.md` and the notebook in `the-notebook.md`.

Open the lane file before you route to it. A lane you have not read is a name,
not a skill, and you can produce a confident routing answer without reading
anything that looks exactly like real routing. When you report, say which files
you actually read.

If a lane file is not retrievable, say so rather than answering from the lane
name alone.
"""
open(sys.argv[2],'w').write(out)
PY2

cat > "$P/README-first.txt" <<'TXT'
soloagency, as a Claude Project

Use this if you want soloagency on your phone, or scoped to one business.
Skills are not available in the Claude mobile app. Projects are, once created
on a computer.

Setting it up, on a computer:

  1. In Claude, click Projects, then New project. Name it after your business.
  2. Open INSTRUCTIONS.md here. Copy everything below the line of dashes and
     paste it into the project's custom instructions.
  3. Upload every file in the knowledge folder into the project's knowledge.
  4. Start a chat inside that project and say what is on your mind.

After that it works from your phone, inside that project.

What is different from installing the skills properly:

  It only works inside this project, not in every chat.
  The lanes are retrieved rather than loaded on demand, so it is a little less
  reliable about opening the right one.
  You will need to redo this when a new version comes out.

If you can use a computer for your work, install it as a skill instead. See the
README.
TXT

( cd "$OUT" && zip -qr "soloagency-project.zip" project )
rm -rf "$P"

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
  echo "dist/soloagency-project.zip is the Projects version, for phones."
else
  echo "FAILED. See above."
fi
exit $fail
