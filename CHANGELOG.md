# Changelog

## v0.4.0: The notebook, and plain language

**The notebook.** soloagency now keeps one plain markdown file on your machine
at `~/.soloagency/memory.md`, holding a short description of your business,
every decision with the reasoning behind it, and what happened afterwards. The
new `solo-memory` skill owns it, `solo-about` writes the top of it, and all
nineteen other skills read it before asking and write to it after a decision.
Nothing is sent anywhere. Nothing is written until a skill runs. Move it with
`SOLOAGENCY_HOME`. See `references/MEMORY.md`.

The outcome line is the point. A record of what you decided and what actually
happened is worth more than general advice, and it cannot be backfilled later.

**The gate is no longer specific to this pack.** `scripts/gate.sh` now reads
its rules from `.gate.json` and takes a target directory, so it can check any
skill library:

```
./scripts/gate.sh ~/.claude/skills my-rules.json
```

It also now checks that every skill references the notebook.

**Plain language.** The README and the contract were written for someone who
builds agent systems. They are now written for someone running a business on
their own. The skills table says what you are stuck on rather than what the
skill is architecturally.

The installer tells you about the notebook when it runs.

## v0.3.1

Install instructions rewritten around the two paths that are actually verified:
the plugin marketplace for Claude Code, and the multi-root installer for tools
without a plugin system. Adds a quick start at the top, the full table of skill
roots the installer looks for, how to update each way, how to recover if you
installed both, and how to uninstall cleanly.

The installer now warns when soloagency also appears to be installed as a
Claude Code plugin, since that leaves two copies of every skill competing to
answer.

## v0.3.0: Teams, graph, loops

Three skills for work that spans more than one skill.

- **`solo-crew`** runs a lane as an ordered team, carrying a handoff packet
  between members so the founder explains their business once rather than once
  per skill. A fact enters the packet only with an artifact behind it, and the
  crew stops when a member a downstream member depends on returns
  `NOT VERIFIED`.
- **`solo-graph`** runs genuinely independent branches in parallel and merges
  them, with an independence test that refuses fake parallelism, attribution on
  every merged fact, and an independent `solo-receipts` check on the merge.
  Capped at two or three branches, because one person cannot supervise more.
- **`solo-loop`** sets up standing checks: weekly money, monthly trajectory,
  quarterly stop-doing. Every loop needs a threshold and an action attached to
  it, or it is a chore that gets dropped.

The front desk now hands multi-skill crews to `solo-crew` rather than running
them itself.

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
