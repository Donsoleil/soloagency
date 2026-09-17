#!/usr/bin/env bash
# Checks every skill against the soloagency contract.
# Run locally with ./scripts/gate.sh, and in CI on every push and PR.
set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
note() { echo "  FAIL  $1"; fail=1; }

[[ -d skills ]] || { echo "no skills/ directory"; exit 1; }

for d in skills/*/; do
  n=$(basename "$d")
  f="$d/SKILL.md"
  echo "$n"

  [[ -f "$f" ]] || { note "no SKILL.md"; continue; }

  # frontmatter opens on line 1 and name matches the directory
  [[ "$(sed -n '1p' "$f")" == "---" ]] || note "frontmatter does not start on line 1"
  fm=$(sed -n '2s/^name: //p' "$f")
  [[ "$fm" == "$n" ]] || note "frontmatter name '$fm' does not match directory '$n'"

  # a description exists and is substantial enough to route on
  desc=$(sed -n 's/^description: //p' "$f" | head -1)
  [[ -n "$desc" ]] || note "no description"
  [[ ${#desc} -ge 120 ]] || note "description is ${#desc} chars, too thin to route on (want 120+)"

  # the contract
  grep -qi "Do NOT use" "$f" || note "no anti-trigger (needs a 'Do NOT use' clause)"
  grep -q "^## Evidence" "$f"  || note "no ## Evidence section"
  grep -q "Studio140" "$f"     || note "no Studio140 credit line"

  # house style
  grep -q "—" "$f" && note "contains an em dash"
done

# repo docs follow the same house style
echo "repo docs"
for f in README.md ROADMAP.md CHANGELOG.md references/CONTRACT.md; do
  [[ -f "$f" ]] || continue
  grep -q "—" "$f" && note "$f contains an em dash"
done
grep -q "Studio140" README.md || note "README.md has no Studio140 credit"
grep -q "Studio140" LICENSE   || note "LICENSE has no Studio140 copyright"

echo
if [[ $fail -eq 0 ]]; then
  echo "PASS: $(ls -d skills/*/ | wc -l | tr -d ' ') skills and the repo docs meet the contract"
else
  echo "FAILED. See above."
fi
exit $fail
