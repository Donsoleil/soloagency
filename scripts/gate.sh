#!/usr/bin/env bash
# Checks skills against a written contract.
#
#   ./scripts/gate.sh                  check this repo
#   ./scripts/gate.sh ~/.claude/skills check any other skill library
#   ./scripts/gate.sh <dir> <rules>    use a different rules file
#
# Rules live in .gate.json so this script is not specific to soloagency.
# Point it at your own skill library to find the ones that will misfire.
set -uo pipefail

HERE="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$HERE/skills}"
RULES="${2:-$HERE/.gate.json}"

[[ -d "$TARGET" ]] || { echo "not a directory: $TARGET"; exit 1; }
[[ -f "$RULES"  ]] || { echo "no rules file: $RULES"; exit 1; }

rule(){ python3 -c '
import json,sys
r=json.load(open(sys.argv[1]))
v=r.get(sys.argv[2])
print("\n".join(v) if isinstance(v,list) else (v if v is not None else ""))
' "$RULES" "$1"; }

MIN_DESC=$(rule min_description_chars); MIN_DESC=${MIN_DESC:-0}
REQ_SECTIONS=$(rule required_sections)
REQ_STRINGS=$(rule required_strings)
BANNED=$(rule banned_strings)
DOCS=$(rule checked_docs)



fail=0
note(){ echo "  FAIL  $1"; fail=1; }
count=0

for d in "$TARGET"/*/; do
  [[ -f "$d/SKILL.md" ]] || continue
  n=$(basename "$d"); f="$d/SKILL.md"; count=$((count+1))
  echo "$n"

  [[ "$(sed -n '1p' "$f")" == "---" ]] || note "frontmatter does not start on line 1"
  fm=$(sed -n '2s/^name: //p' "$f")
  [[ "$fm" == "$n" ]] || note "frontmatter name '$fm' does not match directory '$n'"

  desc=$(sed -n 's/^description: //p' "$f" | head -1)
  [[ -n "$desc" ]] || note "no description"
  [[ ${#desc} -ge $MIN_DESC ]] || note "description is ${#desc} chars, too thin to route on (want ${MIN_DESC}+)"
  grep -qi "Do NOT use" "$f" || note "no anti-trigger (needs a 'Do NOT use' clause)"

  while read -r sec; do [[ -z "$sec" ]] && continue
    grep -q "^## $sec" "$f" || note "no ## $sec section"
  done <<< "$REQ_SECTIONS"

  while read -r str; do [[ -z "$str" ]] && continue
    grep -qF "$str" "$f" || note "missing required string: $str"
  done <<< "$REQ_STRINGS"

  while read -r bad; do [[ -z "$bad" ]] && continue
    grep -qF "$bad" "$f" && note "contains banned string: $bad"
  done <<< "$BANNED"
done

if [[ "$TARGET" == "$HERE/skills" ]]; then
  echo "repo docs"
  while read -r doc; do [[ -z "$doc" ]] && continue
    [[ -f "$HERE/$doc" ]] || continue
    while read -r bad; do [[ -z "$bad" ]] && continue
      grep -qF "$bad" "$HERE/$doc" && note "$doc contains banned string: $bad"
    done <<< "$BANNED"
  done <<< "$DOCS"
fi

  # every skill must be listed in the README table, not just mentioned in prose
  if [[ -f "$HERE/README.md" ]]; then
    table=$(sed -n '/^## What it can help with/,/^You do not need/p' "$HERE/README.md")
    for d in "$TARGET"/*/; do
      sn=$(basename "$d")
      grep -qF "\`$sn\`" <<< "$table" || note "$sn is not listed in the README table"
    done
  fi

  # the privacy promise is load-bearing: nothing may phone home
  # Call syntax only. Words like "analytics" are legitimate business vocabulary.
  offender=$(grep -rlnE "curl +(-[A-Za-z]+ +)*https?://|wget +https?://|requests\.(get|post)\(|urllib\.request|fetch\( *[\"'\`]https?://" \
       "$TARGET"/*/SKILL.md 2>/dev/null | head -1)
  [[ -n "$offender" ]] && note "looks like a network call in $offender (nothing here may phone home)"

echo
if [[ $fail -eq 0 ]]; then
  echo "PASS: $count skills meet the contract"
else
  echo "FAILED. See above."
fi
exit $fail
