---
name: solo-tune
description: "Looks at how you have actually been using soloagency and proposes changes to the skills themselves. Use when the founder says 'this keeps getting it wrong', 'why does it always ask me that', 'tune this', 'improve the skills', 'that advice did not work', when a skill gives bad guidance worth correcting, or after a month of real use. It reads the local usage log and your notebook, finds patterns, and offers fixes you approve before anything changes. Do NOT use it to edit skills based on a single bad answer, to invent patterns from an empty log, or to send anything anywhere without showing you the exact text first."
---

# solo-tune

Skills written in advance are guesses about what you will need. This one looks
at what you actually needed and fixes the guesses.

It reads two local files and nothing else: the usage log at
`~/.soloagency/usage.jsonl` and your notebook at `~/.soloagency/memory.md`.

## What the usage log holds

One line per skill invocation, written as you go:

```json
{"ts":"2026-03-14T09:12Z","skill":"solo-pricing","asked":"raise prices",
 "acted":true,"outcome":null,"note":"assumed per-seat, product is single-operator"}
```

No business detail, no numbers. Which skill, roughly what for, whether you did
anything with the answer. The notebook holds the substance; this holds the
pattern.

## What it looks for

**Skills that never fire.** Twenty-one skills and nine have never been used.
Either their descriptions do not match how you talk, or you do not need them.
Both are worth knowing, and the second is a reason to delete rather than fix.

**Skills that fire and get ignored.** Worse than never firing. Something is
being answered badly enough that you routinely discard it.

**The wrong skill firing.** You asked about pricing and got the launch skill.
That is a description problem, and it is fixable in one line.

**Advice that was followed and went badly.** The notebook outcome lines are the
only place this shows up. It is the rarest signal and by far the most valuable.

**The same question asked twice.** If a skill keeps asking something the
notebook answers, the skill is not reading it. That is a bug.

## Before it proposes anything

Three patterns minimum, or a single case with a bad outcome recorded. One
irritating answer is not a pattern, and tuning on it will make the skill worse
for the next situation.

If the log is thin, say so and stop. An empty log means use it more, not that
there is nothing to learn.

## What it proposes

Concrete edits, shown as a diff against the skill file, with the evidence
behind each one. Description wording, a missing anti-trigger, a step that
assumes something your business does not have, a question that should be read
from the notebook instead.

You approve or reject each. Nothing changes on its own.

## Sharing a lesson

When a pattern is about the skill rather than about your business, it is
probably true for other people too. `solo-tune` can offer to contribute it back
as a GitHub issue on the repo.

The rules, and they are not negotiable: it writes the text, it shows you the
exact text, and it sends nothing until you say yes. No numbers, no customer
names, no prices, no business detail. Only the shape of the problem. If a
lesson cannot be written without specifics, it does not get offered.

Your notebook never leaves your machine. Neither does the usage log. The only
thing that can travel is a sentence you read and approved.

## Evidence

The path and line count of both files, the patterns found with the count behind
each, the proposed edits as diffs, and which were accepted. A tuning run that
proposes changes without a count behind each pattern is `NOT VERIFIED`.

---
Studio140 · see references/CONTRACT.md
