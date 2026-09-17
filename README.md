# soloagency

Skills for people running the whole company themselves.

By [Studio140](https://github.com/donsoleil). MIT licensed.

**v0.1 — Business.** Thirteen skills covering the decisions that come before
code: who you are building for, whether they will pay, what to charge, how to
take the money, how to get the first customers, and the legal floor under all
of it.

Orchestration, teams, and the research and design lanes ship in later
versions. See [ROADMAP.md](ROADMAP.md).

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
/plugin marketplace add donsoleil/soloagency
/plugin install soloagency
```

### Everything else

The installer links the skills into every agent skill root it finds on your
machine: Claude Code, Codex, OpenCode, Cursor, Goose, Berd, and a shared
`~/.agents/skills`. One canonical copy lives in
`~/.agents/sources/soloagency`, so an update refreshes every tool at once.

```
git clone https://github.com/donsoleil/soloagency.git
cd soloagency
./install-soloagency.sh . --dry-run
./install-soloagency.sh .
```

It will not overwrite a directory you wrote yourself, and it reports what it
skipped. Restart each agent afterwards, since they index skills at launch.

## Contributing

Issues and PRs welcome. A new skill has to carry an Evidence section and at
least one anti-trigger in its description, or it will not be merged.

## Credits

Written by Studio140. The scope of the business lane was informed by
[solo-founder-skills](https://github.com/whawkinsiv/solo-founder-skills) by
Will Hawkins, MIT licensed. See [NOTICE.md](NOTICE.md).
