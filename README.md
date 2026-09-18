# soloagency

You are the whole company. There is nobody to ask whether the price is right,
whether the contract is fine to sign, or whether the thing you spent the
weekend on was worth doing.

soloagency is a set of skills for that. You describe the problem in your own
words, and it works out which question you are actually asking, tells you what
it would need to know to answer properly, and says plainly when something is
outside what it can help with.

By [Studio140](https://www.140.studio/). MIT licensed.

## Try it

```
/plugin marketplace add Donsoleil/soloagency
/plugin install soloagency@soloagency-marketplace
```

Then just say what is on your mind. No commands, no picking a skill.

> I'm trying to decide whether to raise my prices next term. Not sure if I
> should, or by how much, or how to tell my customers.

What comes back is not a pricing lecture. It notices that is three separate
problems in one sentence, says which to deal with first, warns you that raising
prices on people who already signed up is hard to walk back, and tells you it
cannot give you a number until it knows what each unit actually costs you.

Not using a tool with plugins? See [Install](#install).

## The rules it works by

**It tells you when it is guessing.** Every answer ends with what it is based
on. If it made something up because a number was missing, it says so instead of
producing a confident figure you might act on.

**It reads before it asks.** If your payment account knows what you charge, it
looks rather than asking you to remember. And it keeps a notebook (below) so
you never explain your business twice.

**It says when something is one-way.** Some choices you can undo by Friday.
Others, like changing the price on existing customers or signing something, you
cannot. It flags the difference before you act, not after.

There is a fourth, less glamorous rule: it tells you when a problem is outside
what it covers. It handles the business side. When the answer is really about
code or design, it says so and points you elsewhere rather than bluffing.

## The notebook

soloagency keeps a notebook on your computer at `~/.soloagency/memory.md`.

It holds a short description of your business, every real decision you make,
why you made it, and what happened afterwards. Alongside it sits a short usage
log, `usage.jsonl`, recording which skills ran and whether you acted on them.
Both are plain files in the same folder. Nothing gets sent anywhere and nothing
can be.

This is what makes it better in month six than in week one. It stops asking you
the same questions, and the record of what you tried and how it went is worth
more than any general advice, because it is about your business rather than
businesses in general.

Full detail, including how to move it or turn it off:
[references/MEMORY.md](references/MEMORY.md).

## It gets better as you use it

Two loops, and neither one sends anything without you reading it first.

**Yours.** Alongside the notebook, soloagency keeps a short usage log of which
skills ran and whether you acted on the answer. Run `solo-tune` after a few
weeks and it reads both, finds the patterns, and proposes edits to the skills
themselves. Skills that never fire. Skills you keep ignoring. The wrong one
answering. Advice you took that went badly. You approve each change, nothing
edits itself.

**Everyone's.** When a lesson is about the skill rather than about your
business, `solo-tune` offers to open an issue here. It writes the text, shows
it to you in full, and sends nothing unless you say yes. No numbers, no names,
no prices.

There is no telemetry and no phone home. The code contains nothing that could.
Details in [references/TUNING.md](references/TUNING.md).

## What it can help with

| When you are stuck on | Ask about | It is called |
|---|---|---|
| Not knowing where to start | anything, in your own words | `soloagency` |
| A vague plan you cannot act on | what you are actually trying to do | `solo-brief` |
| Whether something really got done | proof rather than reassurance | `solo-receipts` |
| Explaining your business again | telling it about you once | `solo-about` |
| Remembering what you decided | what you chose and how it went | `solo-memory` |
| It keeps getting something wrong | fixing the skills themselves | `solo-tune` |
| A job that needs several steps | doing the whole thing at once | `solo-crew` |
| Too much to do at once | what can run in parallel | `solo-graph` |
| Only noticing problems too late | a weekly or monthly check | `solo-loop` |
| Not knowing who you are selling to | who your customer actually is | `solo-customer-research` |
| Whether the market is big enough | the size of it, and who else is in it | `solo-market-research` |
| Whether to build the thing at all | testing if anyone will pay first | `solo-validate` |
| Competing with someone better funded | using what you know that they do not | `solo-niche-advantage` |
| What to charge | pricing, tiers, raising your rates | `solo-pricing` |
| Getting paid without losing money | payments, failed cards, tax | `solo-payments` |
| People visiting but not buying | where they drop off | `solo-conversion` |
| A homepage that does not sell | what it should say and in what order | `solo-landing-page` |
| Launching to nobody | getting your first customers | `solo-launch` |
| Growth that has stalled | one channel, worked properly | `solo-growth` |
| Whether you need a community | and how not to be eaten by one | `solo-community` |
| The legal stuff you have avoided | entity, terms, contracts, a lawyer | `solo-legal` |
| Holding money that is not yours | whether that makes you a regulated business | `solo-money-rules` |
| Handling personal or health data, or a security form | what privacy rules demand of your setup | `solo-compliance` |

You do not need to memorise any of that. Describe the problem and the right one
gets picked.

Nothing here is legal, tax, or financial advice. It is preparation for a
conversation with someone licensed.

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

### Where it works

| Surface | How it gets there |
|---|---|
| Claude Code | plugin, or the installer |
| Codex, Cursor, OpenCode, Goose, Berd | the installer |
| Claude desktop and web | upload the bundle as an account skill, below |
| Cloud and remote sessions | account skills reach these. Plugins and local installs do not, since each session is a fresh container |

### Claude desktop, web, and cloud sessions

These do not see plugins or anything installed on your own machine. Every cloud
session is a fresh container. Account skills are the only thing that travels,
so upload the bundle:

Download `soloagency.zip` from the
[latest release](https://github.com/Donsoleil/soloagency/releases/latest), then
go to Settings, Capabilities, Skills, and upload it.

That is one upload for the whole pack. The front desk is the skill, and the
other 21 ride along as files it reads when it needs them, so routing still
works. Ask in plain words exactly as you would anywhere else.

Building it yourself instead:

```
./scripts/package-skills.sh
```

That writes `dist/soloagency.zip`, plus `dist/individual/` with one zip per
skill if you would rather upload only some of them.

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

Your notebook is separate and survives an uninstall on purpose, in case you
reinstall. Remove it too if you want it gone:

```
rm -rf ~/.soloagency
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
