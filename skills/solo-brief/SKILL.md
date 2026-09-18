---
name: solo-brief
description: "Turns a rough founder ask into something an agent can actually run. Use when a request is vague, contains several asks at once, has no success condition, or is about to be handed to an agent or automation: 'here's what I want to do', 'can you help me with this', a long paragraph of mixed problems, or before dispatching any multi-step task. Also use when the founder asks to grade, sharpen, or rewrite a prompt they wrote. Do NOT use for a crisp single-step request that is already clear, and when a dedicated agent-prompt grader such as prompt-grader is installed, hand the harness-level rubric to it rather than duplicating it."
---

# solo-brief

Most founder asks fail not because the model is weak but because the ask has no
falsifiable end. This skill fixes the ask before anyone acts on it.

## Defer when a specialist exists

If `prompt-grader` or an equivalent agent-prompt skill is installed, that skill
owns the harness-level questions: authority boxes, mutation scope, receipts,
autonomy honesty, unattended execution. Hand those over rather than running a
second, weaker version of them.

What stays here is the founder-layer rubric below, which agent-prompt graders do
not cover because they assume the business decision is already made.

## The founder rubric, six questions

1. **Who is the customer, by name?** Not "users". A segment you could build a
   list of. If the ask does not name one, that is the first gap.
2. **What is the measurable outcome?** A number with a direction and a date.
   "Grow" is not an outcome. "Ten paying customers by March" is.
3. **What does it cost, in money and hours?** Both. Solo founders underprice
   their own time and then wonder where the month went.
4. **Is it reversible?** Reversible means ship and watch. One-way means slow
   down. Price changes on existing customers, signatures, public launches, and
   anything touching a live card are one-way.
5. **What evidence ends it?** The artifact that proves it happened. If you
   cannot name one, the task cannot complete, only stop.
6. **What is being given up?** Every yes for one person is a no somewhere. If
   nothing is being dropped, the plan is fantasy scheduling.

## Output

```
Sharpened ask: <one sentence>
Missing: <the rubric items with no answer, or "nothing">
Reversible: <yes | one-way, because ...>
Evidence that ends it: <artifact>
Dropped to make room: <thing, or "nothing, and that is a risk">
```

Then either the rewritten ask, ready to run, or the single question that
unblocks it. Never both, and never more than one question.

## The rule that matters most

Do not fill gaps with plausible defaults. If the customer is unnamed, say it is
unnamed. An invented segment produces an entire plan aimed at nobody, and it
reads confident the whole way down, which is what makes it expensive.

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

The output block above, with `Missing` populated honestly. A brief where
`Missing` says nothing, on an ask that arrived vague, is `NOT VERIFIED`.

---
Studio140 · see references/CONTRACT.md
