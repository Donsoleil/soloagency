---
name: solo-loop
description: "Sets up and runs standing recurring checks so a one-person business notices problems without anyone remembering to look: a weekly money check, a monthly trajectory check, a quarterly stop-doing pass. Use when the founder says 'I keep forgetting to check', 'set up a weekly review', 'how do I stay on top of this', 'I only noticed after it got bad', or when the same question gets asked repeatedly at irregular intervals. Do NOT use for one-off work (solo-crew), for parallel work (solo-graph), or to create rituals with no defined trigger for action, which is how a review becomes a chore nobody does."
---

# solo-loop

A loop is worth existing only if it can change a decision. A review that always
ends "looks fine, see you next week" is a chore, and it will be dropped in
month two, correctly.

Every loop needs four things: a cadence, the numbers it reads, a threshold that
means act, and an action attached to that threshold. Missing the threshold is
what turns a review into a ritual.

## The three that pay for themselves

**Weekly money check.** Reads: cash in, failed payments and recovery rate, new
customers, cancellations. Thresholds worth setting: failed payment recovery
below a line you pick, cancellations above a normal week, cash covering fewer
weeks than you are comfortable with. Each threshold names what happens when it
trips, and `solo-payments` or `solo-conversion` usually owns the response.

**Monthly trajectory check.** Not the same as the weekly. This one asks whether
the direction is right, not whether the week was. Compare where revenue and
customer count are against where they needed to be for the income floor in
`ABOUT.md`. If the gap is widening for two consecutive months, that is the
threshold, and the response is a lane change, not more effort in the same lane.

**Quarterly stop-doing pass.** List everything consuming recurring hours. For
each, name the customers or the evidence it produced this quarter. Anything with
neither gets dropped, and dropping one thing is the minimum output. A solo
founder's real constraint is hours, and this is the only loop that returns any.

## Setting one up

Write it down as: cadence, inputs with where each number comes from, thresholds,
and the action per threshold. Put it in the repo or wherever the work lives, not
in your head. Then run it once manually before scheduling it, because a loop
that reads a number you cannot actually get is discovered on day one this way
rather than in month three.

## Keeping them honest

Every loop run produces a line: date, the numbers, whether a threshold tripped,
what was done. Keep them in one file. Three months of those lines is the only
honest record of whether the business is working, and it is far better than
memory, which flatters.

If a loop has not tripped a threshold in six months, either the thresholds are
too loose or the loop is not needed. Both are worth knowing.

## The notebook

Read `~/.soloagency/memory.md` before asking the founder anything it already
answers. When this skill produces a decision, write the entry: what was
decided, why, whether it is one-way, the evidence behind it, and
`Outcome: (open)`. `solo-memory` owns the format.

A decision made and not written down is a decision you will make again from
scratch in four months.

Write one line to `~/.soloagency/usage.jsonl` as well: which skill ran, roughly
what for, and whether the founder acted on it. No numbers, no business detail.
That log is what `solo-tune` reads later to work out which skills are earning
their place.

## Evidence

The written loop definition with a threshold and an action per input, plus the
run log with at least one dated entry containing real numbers. A loop described
but never run once is `NOT VERIFIED`.

---
Studio140 · see references/CONTRACT.md
