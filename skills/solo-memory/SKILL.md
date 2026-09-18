---
name: solo-memory
description: "Keeps the notebook. Reads and writes the founder's own file at ~/.soloagency/memory.md, where every decision, the reason behind it, and what actually happened later get written down. Use when a decision gets made, when an outcome becomes known, when the founder asks 'what did I decide about this', 'did that work', 'what have I tried', 'why did I do it that way', or at the start of any skill that would otherwise ask a question the notebook already answers. Do NOT use it to store live numbers a connector can fetch, to record advice nobody acted on, or as a diary of things that were merely discussed."
---

# solo-memory

Running a business alone means nobody else remembers why you did anything. Six
months later you cannot recall whether the price went up because costs moved or
because someone told you to, and you cannot tell whether it worked.

This is the notebook that fixes that. One file, on your machine, yours.

## Where it lives

`~/.soloagency/memory.md`

Plain markdown. You can open it, read it, edit it, delete it. Nothing is sent
anywhere. If you want it somewhere else, set `SOLOAGENCY_HOME`.

## What goes in it

Three parts.

**About you.** Written once by `solo-about`, updated when something real
changes. Who you are, what the business is, your income floor, hours you
actually have. Every other skill reads this instead of asking you again.

**Decisions.** One entry per real decision. Not per conversation.

```
## 2026-03-14 · pricing
Decided: raising the semester rate from 12 to 14 per meal, new families only.
Because: all-in cost per meal is 9.40, and the old rate left nothing for the
  delivery driver. Existing families grandfathered.
One-way: yes, on anyone who accepts the new rate.
Evidence: cost sheet in drive, 3 months of invoices.
Outcome: (open)
```

**Outcomes.** The `Outcome` line, filled in later. This is the part that
matters and the part everyone skips.

## The outcome rule

An entry with `Outcome: (open)` is unfinished. When you find out what happened,
write it, including when it went badly. A notebook that only records the wins
teaches nothing and will quietly make you overconfident.

Review open entries when a loop runs, or whenever a decision comes up again.

## What stays out

Live numbers a connector can fetch. Revenue, customer count, traffic. Those go
stale in a week and a stale number in a notebook gets used as if it were true.

Advice you did not take. If you decided against something, that is a decision
and it gets an entry. If you just read a suggestion and moved on, it is not.

## How other skills use it

Read before asking. If the notebook answers the question, do not ask it again.
Write after deciding, not after discussing. And when an entry contradicts what
the founder just said, surface both rather than picking the newer one, because
people misremember their own reasoning constantly.

## Starting from nothing

First run, the file does not exist. Create it with the About you section and
nothing else. Do not backfill decisions from memory, yours or the founder's.
An invented history is worse than an empty file.

## Evidence

The file path, the number of entries, and how many still say
`Outcome: (open)`. A session that made a decision and wrote no entry did not
run this skill, whatever it says.

---
Studio140 · see references/CONTRACT.md
