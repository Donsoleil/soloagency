---
name: solo-crew
description: "Runs a lane as an ordered team instead of one skill at a time, carrying context between members so the founder never re-explains. Use when the desk has bound a crew, when an ask needs three or more skills in sequence, or when the founder says 'do the whole thing', 'run the lane', 'take it end to end', 'don't ask me again halfway through'. Do NOT use for a single-skill ask, for branches that could run in parallel and need merging (solo-graph), for standing recurring work (solo-loop), or as a way to skip the evidence gate at each handoff."
---

# solo-crew

A crew is a sequence of skills where each one inherits what the last one
produced. The founder answers a question once, and every member downstream
already has the answer.

Without this, a founder running four skills by hand re-states the segment four
times and gets four slightly different versions of their own business back.

## The handoff packet

Between every member, carry exactly this. Nothing else travels.

```
Ask:        <the sharpened ask from solo-brief, unchanged all the way through>
Established: <facts confirmed so far, each with the member that produced it>
Open:        <what is still unknown, and who is expected to close it>
Evidence:    <artifacts produced so far, with paths or URLs>
Budget:      <passes used / passes allowed>
```

`Established` is the important one. A fact enters it only when the member that
produced it named an artifact. A guess never enters, because downstream members
cannot tell the difference and will build on it.

## Running it

1. State the crew, in order, before starting. The founder can veto a member.
2. Run the first member. Collect its Evidence line.
3. Update the packet. Show it, compressed to three or four lines.
4. Run the next member with the packet as its input.
5. Stop at any member whose Evidence line reads `NOT VERIFIED` on something the
   rest of the crew depends on. Say what is missing and ask once.

Step 5 is the whole point. A crew that continues past a failed dependency is
just four skills producing confident output about nothing.

## Stopping rules

Stop and report, rather than continuing, when: the budget is spent, a member
needs a decision only the founder can make, a member's finding invalidates the
original ask, or two members disagree on an established fact.

Disagreement is signal. Surface both positions and the artifact behind each
rather than picking the more recent one.

## When the crew is wrong

If halfway through it becomes clear the lane was misread, say so and stop. Going
back to the desk costs one message. Finishing the wrong lane costs the whole
run and the founder's trust in the routing.

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

The final packet, with every `Established` fact carrying the member that
produced it and an artifact. Plus passes used against budget, and the exit
condition marked met or not. A crew report with an empty Evidence field did not
run, whatever its prose says.

---
Studio140 · see references/CONTRACT.md
