# soloagency

Skills for people running the whole company themselves.

By [Studio140](https://www.140.studio/). MIT licensed.

**v0.3, Teams and loops.** Twenty skills. A front desk that takes a fuzzy ask
and routes it, a brief step that sharpens it first, an evidence gate that
catches work that did not happen, crews and graphs for work spanning several
skills, standing loops that notice problems without being asked, and the
thirteen business skills underneath:
who you are building for, whether they will pay, what to charge, how to take
the money, how to get the first customers, and the legal floor under all of it.

Start with `soloagency` if you are not sure which skill you need.

The research, UX, design and product lanes ship in v0.4. See [ROADMAP.md](ROADMAP.md) and [CHANGELOG.md](CHANGELOG.md).

## Quick start

```
/plugin marketplace add Donsoleil/soloagency
/plugin install soloagency@soloagency-marketplace
```

Then ask in plain words, no skill name needed:

> I'm trying to decide whether to raise my prices next term. Not sure if I
> should, or by how much, or how to tell my customers.

The front desk reads that as three asks wearing one sentence, names which comes
first, flags the price change as one-way because it hits people who already
signed up, and tells you which numbers it is missing rather than inventing
them.

Not using a tool with plugins? See [Install](#install).

## What makes these different

Most founder-advice skills hand you a checklist. These four rules, spelled out
in [references/CONTRACT.md](references/CONTRACT.md), are enforced in every
skill body:

1. **Evidence, not assertion.** Each skill names the output that proves it ran.
   No output, and the answer says `NOT VERIFIED`.
2. **Read before you recommend.** If Stripe knows your prices, the skill reads
   Stripe instead of asking you to remember them.
3. **Name the reversibility.** Anything one-way, a price change on existing
   customers, a signature, a compliance-shaped architecture decision, gets
   flagged as one-way before it is recommended.
4. **Route out, don't fake competence.** These cover business. When the ask
   turns into code or interface, they say so and name the specialist.

## Skills

| Lane | Skill | For |
|---|---|---|
| Desk | `soloagency` | Fuzzy ask in, lane and crew out |
| | `solo-crew` | Run a lane as a team, context carried between members |
| | `solo-graph` | Parallel branches, merged, independently checked |
| | `solo-loop` | Standing checks with thresholds that mean act |
| | `solo-brief` | Sharpen the ask before anyone acts on it |
| | `solo-receipts` | Verified, Reported, Not verified, kept apart |
| | `solo-about` | Founder context, written once, read by everything |
| Validate | `solo-customer-research` | Who this is actually for, in their words |
| | `solo-market-research` | Bottom-up sizing, competitor teardown |
| | `solo-validate` | Will anyone pay, tested before you build |
| | `solo-niche-advantage` | Turning domain expertise into distribution |
| Money | `solo-pricing` | Value metric, tiers, the number |
| | `solo-payments` | Taking money reliably, plugging the leaks |
| | `solo-conversion` | Finding and fixing the funnel leak |
| Launch and grow | `solo-landing-page` | One page that sells in eight seconds |
| | `solo-launch` | Concentrating demand you already built |
| | `solo-growth` | One channel, worked properly |
| | `solo-community` | Whether to have one, and how not to be eaten |
| Floor | `solo-legal` | Entity, terms, contracts, and what needs a lawyer |
| | `solo-compliance` | What a regulation demands of your actual stack |

Nothing here is legal, tax, or financial advice.

## Install

Pick one of the two. Do not do both for the same tool, or you get two copies of
every skill competing to answer.

### Claude Code, and any tool with plugins

The short path. Two commands, and `/plugin update` keeps it current.

```
/plugin marketplace add Donsoleil/soloagency
/plugin install soloagency@soloagency-marketplace
```

Check it took:

```
/plugin
```

`soloagency` should be listed under Installed, marked active. Restart Claude
Code so the skills get indexed, then just ask something in plain words. The
front desk triggers on the shape of a messy ask, so you do not need to name a
skill.

### Codex, Cursor, OpenCode, Goose, Berd, and everything else

Those have no plugin system, so the installer links the skills into every agent
skill root it finds on your machine. One canonical copy lives in
`~/.agents/sources/soloagency`, and every root gets a symlink into it, so a
single `git pull` updates all of them at once.

```
git clone https://github.com/Donsoleil/soloagency.git ~/.agents/sources/soloagency
cd ~/.agents/sources/soloagency
./install-soloagency.sh . --dry-run
./install-soloagency.sh .
```

The dry run prints exactly what it would link and changes nothing. Read it,
then drop the flag.

Roots it looks for, installing only where the tool already exists:

| Tool | Root |
|---|---|
| Claude Code | `~/.claude/skills` |
| Goose and shared | `~/.agents/skills` |
| Codex | `~/.codex/skills` |
| OpenCode | `~/.config/opencode/skills` or `~/.opencode/skills` |
| Cursor | `~/.cursor/skills` |
| Berd | `~/Library/Application Support/xyz.block.berd/skills` |

If a tool you use is missing, open an issue with its skill directory and it
gets added.

It never overwrites a real directory you wrote yourself, it reports what it
skipped, and it is safe to re-run. Restart each agent afterwards, since they
index skills at launch.

### Updating

Plugin install:

```
/plugin update soloagency
```

Installer install, one pull updates every linked tool:

```
git -C ~/.agents/sources/soloagency pull
```

Only re-run the installer when a release adds new skills, since existing links
already point at the updated files.

### If you used both

Claude Code will have the plugin's copy and a symlinked copy of the same 20
skills. Keep the plugin and remove the links for that one tool:

```
find ~/.claude/skills -maxdepth 1 -type l -lname '*sources/soloagency*' -delete
```

Your other tools are untouched.

### Uninstalling

```
/plugin uninstall soloagency
```

and for the linked copies:

```
for r in ~/.claude/skills ~/.agents/skills ~/.codex/skills \
         ~/.config/opencode/skills ~/.cursor/skills \
         ~/Library/Application\ Support/xyz.block.berd/skills; do
  find "$r" -maxdepth 1 -type l -lname '*sources/soloagency*' -delete 2>/dev/null
done
rm -rf ~/.agents/sources/soloagency
```

Nothing else on your machine is touched.

## Contributing

Issues and PRs welcome. A new skill has to carry an Evidence section and at
least one anti-trigger in its description, or it will not be merged. That is
not a manual review step: `scripts/gate.sh` enforces it and runs in CI on
every pull request. Run it yourself before opening one.

```
./scripts/gate.sh
```

## Credits

Written by [Studio140](https://www.140.studio/).
