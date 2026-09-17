# Changelog

## v0.2.0 — Orchestration and prompt routing

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

## v0.1.0 — Business

Thirteen skills across four lanes: Validate, Money, Launch and grow, Floor.
Contract established in `references/CONTRACT.md`: evidence not assertion, read
before you recommend, name the reversibility, route out rather than fake
competence. Multi-root installer covering Claude Code, Codex, OpenCode, Cursor,
Goose, and Berd.
