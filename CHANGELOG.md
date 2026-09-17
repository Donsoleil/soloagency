# Changelog

## v0.2.3

Authorship reads Studio140 everywhere, linking to https://www.140.studio/:
skill footers, LICENSE, both manifests, and the README credit.

The gate now checks the repo docs too, not just `skills/`. README, ROADMAP,
CHANGELOG and the contract are checked for house style, and README and LICENSE
are checked for the credit. Em dashes that had accumulated in those four files
are gone.

## v0.2.2

The contract is now enforced instead of promised. `scripts/gate.sh` checks
every skill for a frontmatter name matching its directory, a description long
enough to route on, an anti-trigger clause, an Evidence section, the credit
line, and house style. It runs in CI on every push and pull request, so a
contribution that skips the Evidence section fails before review.

Per-skill version footers removed. `plugin.json` is the single source of the
pack version, so footers no longer drift each release.

## v0.2.1

Fixed a destructive bug in the installer. Running it from inside
`~/.agents/sources/soloagency` made the source and the canonical destination
the same path, so the script deleted the tree it was about to copy from and
left every linked root pointing at an empty directory. The installer now
detects that case, skips staging, and relinks against what is already there.

Authorship consolidated under Studio140.

## v0.2.0: Orchestration and prompt routing

Four skills that sit above the business lane.

- **`soloagency`** front desk. Takes a fuzzy or multi-part ask, sharpens it,
  names the lane, binds an ordered crew, and declares a loop budget and an
  observable exit condition. Routes out rather than faking competence on code,
  interface, or design work.
- **`solo-brief`** sharpens the ask against a six-question founder rubric:
  named customer, measurable outcome, cost in money and hours, reversibility,
  ending evidence, and what is being given up. Defers harness-level prompt
  grading to `prompt-grader` when that skill is installed.
- **`solo-receipts`** the evidence gate. Separates Verified, Reported, and
  Not verified, and refuses to promote a claim between layers on confidence
  alone.
- **`solo-about`** maintains `ABOUT.md`, the founder context file the rest of
  the pack reads so it stops re-asking the same questions.

Fixed: the installer no longer copies `.git` into the canonical source
directory, which made the canonical copy a detached snapshot instead of
something a `git pull` could update.

## v0.1.0: Business

Thirteen skills across four lanes: Validate, Money, Launch and grow, Floor.
Contract established in `references/CONTRACT.md`: evidence not assertion, read
before you recommend, name the reversibility, route out rather than fake
competence. Multi-root installer covering Claude Code, Codex, OpenCode, Cursor,
Goose, and Berd.
