---
name: solo-receipts
description: "The evidence gate. Use before calling anything done, when a report claims work happened, when a founder asks 'is this actually finished', 'did that work', 'show me proof', 'are we sure', or when an agent returns a confident summary with no artifact behind it. Also use when reconciling what was claimed against what a live system says. Do NOT use as a substitute for doing the work, for code-level test verification when an engineering verification skill is installed, or as a ceremony on trivial single-step tasks."
---

# solo-receipts

One person has nobody to catch their mistakes. This skill is the catch.

The failure it prevents is specific: an agent, or you, produces a fluent
summary of work that did not happen, and it reads exactly like work that did.

## Three layers, kept separate

Never blend these into one confident paragraph. The whole value is the
separation.

**Verified.** There is an artifact. A URL that loads, a number from a live
dashboard, a file at a path, a transaction ID, a screenshot, a command's
output. Name the artifact next to the claim.

**Reported.** Someone said it, including you, including an agent. It may well
be true. It has no artifact. Mark it, do not promote it.

**Not verified.** Claimed, checkable in principle, not checked. Say what would
check it and roughly what that costs.

A claim with no artifact never graduates to Verified by being repeated, by
sounding reasonable, or by being written down more formally.

## The check

For each claim in the thing being reviewed:

1. What artifact would prove this?
2. Does it exist, right now, where I can see it?
3. If yes, does it actually say what the claim says? Open it. Summaries of
   artifacts drift from artifacts, and the drift is always flattering.

Step 3 is the one that gets skipped and the one that catches the real errors.

## External systems

Anything claimed about a system outside this conversation, meaning Stripe, the
site being live, an email that sent, a contract that got signed, needs a read
from that system. Not a memory of having done it. Solo founders lose real money
to "I already turned that on" more often than to any technical failure.

## Output

```
Verified:     <claim> | <artifact>
Reported:     <claim> | <source, no artifact>
Not verified: <claim> | <what would check it>
```

Then one line: is the exit condition met, or not. Say "not yet" plainly. A
gate that never fails is decoration.

## On being wrong

If you previously claimed something and the artifact does not support it, say
so directly and correct it. No hedging, no burying it mid-paragraph. The whole
point of this skill is that the correction is cheap now and expensive later.

## Evidence

The three-layer block, with at least one artifact path or URL per Verified line.
A review where everything lands in Verified with no artifacts named has not run
this skill, whatever it says at the top.

---
140.studio · see references/CONTRACT.md
