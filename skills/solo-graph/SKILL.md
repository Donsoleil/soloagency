---
name: solo-graph
description: "Runs work as a dependency graph when parts can proceed in parallel and have to be merged afterwards, with an independent check at the end. Use when an ask has independent branches, when a deadline forces things to overlap, when two lanes both feed one decision, or when the founder says 'run these at the same time', 'what can I do in parallel', 'these all feed the launch'. Do NOT use for straightforward sequential work (solo-crew), for a single skill, for recurring standing work (solo-loop), or when the branches are not actually independent, in which case say so and run a crew."
---

# solo-graph

A crew is a line. A graph is a line that forks. Use it only when branches are
genuinely independent, because a fake parallel is a sequential run with a
merge conflict at the end.

## Independence test

Two branches are independent only if neither needs a fact the other produces.
Ask directly: if branch B starts now, what would it have to assume about A? If
the answer is anything, it is not independent, and you run a crew instead.

Founders want parallelism because it feels faster. Most of the time the honest
answer is that the work is sequential and the constraint is hours, not ordering.
Say that rather than manufacturing a graph.

## Shape

```
Ask:     <sharpened, from solo-brief>
Branches:
  A: <skills>  produces <facts>  needs <nothing, or it is not a branch>
  B: <skills>  produces <facts>
Merge:   <the decision or artifact that consumes both>
Check:   <who verifies the merge, and it is not a branch owner>
Budget:  <passes allowed per branch>
```

## Merging

The merge is where graphs fail. Two branches return facts that disagree, or
overlap, or one returns nothing and the merge proceeds anyway on half the
input.

Rules: a branch that produced no evidence does not silently contribute a
default. Conflicting facts get surfaced with both artifacts rather than
resolved by recency. And the merge states which branch each merged fact came
from, so a wrong answer is traceable to where it entered.

## The independent check

After the merge, run `solo-receipts` against the merged result. Not by a branch
owner, and not by whoever wrote the merge. This is the one step that catches a
graph that produced a coherent, confident, wrong answer, which is the specific
failure mode of parallel work.

## Practical limit for one person

Two branches, sometimes three. A solo founder cannot supervise more, and an
unsupervised branch produces work nobody checks. If the graph needs four
branches, the ask is too big for this week and should be cut rather than
parallelized.

## The notebook

Read `~/.soloagency/memory.md` before asking the founder anything it already
answers. When this skill produces a decision, write the entry: what was
decided, why, whether it is one-way, the evidence behind it, and
`Outcome: (open)`. `solo-memory` owns the format.

A decision made and not written down is a decision you will make again from
scratch in four months.

## Evidence

The shape block filled in, per-branch evidence artifacts, the merged result
with each fact attributed to its branch, and the independent check's three-layer
output. A merge with no attribution is `NOT VERIFIED`.

---
Studio140 · see references/CONTRACT.md
