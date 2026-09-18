# How soloagency gets better

Two loops. One is yours alone, one is shared, and neither sends anything
without you reading it first.

## The local loop

soloagency keeps a usage log at `~/.soloagency/usage.jsonl`, one line per skill
run: which skill, roughly what you asked about, whether you acted on the
answer. Alongside the notebook at `~/.soloagency/memory.md`, which holds the
substance and the outcomes.

Run `solo-tune` after a few weeks. It reads both, looks for patterns, and
proposes edits to the skill files themselves. Skills that never fire. Skills
you consistently ignore. The wrong skill answering. Advice you took that went
badly.

You approve each change. Nothing edits itself.

This is where most of the improvement comes from, because it is tuned to your
business rather than to businesses in general.

## The shared loop

Some lessons are about the skill, not about you. If the pricing skill keeps
assuming per-seat pricing for a product one person uses, that is wrong for
everybody with a product like yours.

When `solo-tune` finds one of those, it offers to open an issue on the repo. It
writes the text, shows it to you in full, and sends nothing unless you say yes.
No numbers, no names, no prices, no business detail. If the lesson cannot be
described without specifics, it is not offered.

That is the whole mechanism. There is no telemetry, no analytics, no phone
home, and no background process. soloagency cannot send anything on its own,
by design, and the code contains nothing that could.

## Why it works this way

The alternative, collecting usage automatically, would give more data and worse
data. Business decisions cannot be anonymised without destroying what makes
them useful, and a pack that includes a compliance skill should not quietly
become something that needs one.

A lesson a person read and chose to send is worth more than a thousand rows
nobody looked at.

## Turning it off

Delete the files and they will be recreated only when a skill runs again:

```
rm -rf ~/.soloagency
```

Or move them somewhere of your choosing with `SOLOAGENCY_HOME`.
