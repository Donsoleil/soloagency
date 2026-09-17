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

### Claude Code plugin marketplace

```
/plugin marketplace add Donsoleil/soloagency
/plugin install soloagency
```

### Everything else

The installer links the skills into every agent skill root it finds on your
machine: Claude Code, Codex, OpenCode, Cursor, Goose, Berd, and a shared
`~/.agents/skills`. One canonical copy lives in
`~/.agents/sources/soloagency`, so an update refreshes every tool at once.

```
git clone https://github.com/Donsoleil/soloagency.git
cd soloagency
./install-soloagency.sh . --dry-run
./install-soloagency.sh .
```

It will not overwrite a directory you wrote yourself, and it reports what it
skipped. Restart each agent afterwards, since they index skills at launch.

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
