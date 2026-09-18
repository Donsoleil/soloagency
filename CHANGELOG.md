# Changelog

## v0.7.0: The gap the desk could not see

A second real run routed confidently into a lane that could not hold the
question. The ask was whether holding other people's money makes you a
regulated business. The desk sent it to `solo-compliance`, which covers data
privacy regimes and nothing else, and `solo-legal`, which covers entity and
contracts. Money transmission had no owner anywhere in the pack, and the Floor
lane read like it covered regulated work in general.

Three fixes.

**`solo-money-rules`.** A lane for products that hold, pool, move, or pay out
money belonging to other people. It turns on one question, whether funds are
ever under your control, explains why naming it a wallet or a pot or a circle
does not change the answer, and points at the usual way out, which is letting a
licensed processor hold the funds. It is explicit that this is the clearest
"pay a specialist" in the pack and says what to bring them.

**The Floor lane no longer over-claims.** It now states its three members and
their actual scope, and names what it does not cover: tax, trade licensing,
employment law, insurance, import rules, sector regulators.

**A rule for when no lane fits.** If no lane's description names the thing being
asked, say so and stop. Do not pick the nearest one. An adjacent lane produces
a fluent wrong answer that arrives through the same machinery as the right
ones, so the founder cannot tell. Routing out is a result, not a failure.

**The feedback loop survives a container.** The notebook and usage log live on
the founder's machine, so a cloud session, which is exactly where mis-routing
gets noticed, could not record it. `solo-tune` and the desk now hand over the
lines to paste rather than letting the session's learning evaporate.

## v0.6.1: The desk got teeth

Found by running it. In a real session the desk read two files, named six more
lanes it never opened, wrote the analysis itself instead of handing it to a
lane, and skipped `solo-crew` on a four-skill crew. It then caught all three
when asked, which is the only reason we know.

The cause was the desk, not the model. A lane table full of names is enough to
produce a confident routing answer without reading anything, and the desk's
Evidence section never asked which files were actually opened, so nothing
distinguished real routing from an impression of it.

Three changes:

- **Evidence now leads with files read.** Every lane file opened, by path. A
  lane named but not opened does not count as routed, and the skill must say so
  rather than leaving the impression.
- **A self-check before answering.** Did I write domain content myself, did I
  name a lane I did not open, is this a crew I failed to hand to `solo-crew`.
  Those are the three failures in the order they occur.
- **The bundle note moved to the top and states the rule** instead of
  mentioning it in passing. A lane you have not opened is a name, not a skill.

`solo-memory` now handles the case where the notebook is unreachable, which is
every cloud session, by saying the decision was not recorded and offering the
entry to paste, rather than skipping it silently.

## v0.6.0: One upload for cloud sessions

Claude desktop, web, and cloud sessions do not see plugins or anything
installed on your own machine. Account skills are the only thing that reaches
them, and the uploader takes one skill at a time: a single top-level folder,
exactly one SKILL.md, no plugin manifest.

`scripts/package-skills.sh` builds a bundle that satisfies all three. The front
desk is the skill, and the other 21 travel with it as files in `lanes/` that it
reads when a lane needs them, so routing still works from one upload rather
than 22. It also writes one zip per skill in `dist/individual/` for anyone who
wants only some of them.

Every zip is checked after building: one top-level entry, exactly one SKILL.md,
no manifest. CI builds the bundle on every push, so a broken packager is caught
before a release rather than by a rejected upload.

Download `soloagency.zip` from the latest release, or build it yourself.

## v0.5.1

README corrections found by reading it against the repo rather than trusting
it. `solo-tune` was mentioned in the prose but missing from the skills table.
The heading said three rules above a list of four. The notebook section still
claimed one file when v0.5.0 added a second. Uninstall now covers the notebook
folder, which survives an uninstall on purpose.

The gate now checks that every skill appears in the README table, so a skill
can no longer ship invisible to anyone scanning the list.

## v0.5.0: It tunes itself

**`solo-tune`.** Reads the local usage log at `~/.soloagency/usage.jsonl` and
your notebook, finds patterns in how you actually use the pack, and proposes
edits to the skill files. Skills that never fire. Skills that fire and get
ignored. The wrong skill answering. Advice you followed that went badly. It
needs three occurrences or one recorded bad outcome before proposing anything,
shows each change as a diff, and edits nothing without approval.

**Sharing a lesson.** When a pattern is about the skill rather than about your
business, `solo-tune` offers to open an issue on this repo. It writes the text,
shows you the exact text, and sends nothing unless you say yes. No numbers, no
names, no prices. There is an issue template for it.

**No telemetry, and now it is enforced.** The gate fails any skill containing
network-call syntax, so the promise in the README is checked on every push
rather than merely written down. Narrowed to call syntax, since words like
"analytics" are legitimate business vocabulary.

**Where it works.** The README now has a surfaces table. Plugins and local
installs do not travel to cloud or remote sessions, which are fresh containers.
Account skills do. Worth knowing before you wonder why a skill is missing.

The other nineteen skills now write a usage line as well as a notebook entry.

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
