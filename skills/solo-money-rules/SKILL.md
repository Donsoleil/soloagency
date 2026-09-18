---
name: solo-money-rules
description: "For when your product holds, moves, pools, or pays out money that belongs to other people, which can make you a regulated money business without you noticing. Use when the idea involves escrow, a wallet, a float, a pot, rotating savings, lending between users, payouts to third parties, splitting payments, holding funds between two parties, or taking money now and releasing it later. Triggers on 'do I need a money transmitter licence', 'MTL', 'can I hold the funds', 'escrow', 'payouts to users', 'marketplace payments', 'is this regulated', 'we pool contributions'. Do NOT use for taking payment for your own product (solo-payments), for data privacy regimes like GDPR, HIPAA or SOC 2 (solo-compliance), or for entity formation and contracts (solo-legal)."
---

# solo-money-rules

Not legal advice, and this is the skill where that matters most. The purpose
here is to tell you whether you have walked into a regulated activity, early
enough that it is cheap to change, and what to bring to the lawyer you are
going to need.

## The question that decides everything

**Does money that belongs to someone else ever sit under your control, even for
a second?**

If yes, you are probably in regulated territory in most jurisdictions,
regardless of size, intent, or how obvious it feels that you are not a bank.
Volume thresholds mostly do not save you, and neither does calling it something
else in your marketing.

If no, if payment goes directly from payer to payee and you only ever see a fee
for your own service, you are usually in ordinary business territory.

That single distinction is worth more than any amount of reading.

## What tends to trigger it

Holding a balance for users. Pooling contributions and paying them out.
Escrow, meaning taking from one party and releasing to another on a condition.
Facilitating loans or advances between users. Splitting an incoming payment
among several recipients. Storing value for later spending.

Names do not help. A wallet, a pot, a float, a circle, a tab, and a balance are
the same activity described differently, and a regulator reads the activity.

## The way out, and it is usually the right move

Do not touch the money. Use a licensed processor's facilities so the funds are
held by someone who is already regulated for it, and your product orchestrates
rather than holds. Most serious processors sell exactly this, marketplace and
connected-account style arrangements, precisely because everyone hits this
wall.

That changes your economics, because you are now paying for it, and it
constrains product design. It also removes the single largest legal risk a
small team can carry, and it is far cheaper than the alternative.

The second way out is to never take custody at all: introduce the parties and
let them pay each other directly. Weaker product, no licensing question.

## What this costs if you get it wrong

Licensing regimes for money transmission are typically per-jurisdiction, slow,
and expensive, with capital requirements and bonding. Operating without one
where it is required is not a fine-and-carry-on situation. This is the reason
the answer is almost always "do not hold the money" for anyone without funding.

## Reversibility

One-way, and early. This decision shapes your architecture, your processor
relationship, and your unit economics. Retrofitting custody out of a product
that assumed it is close to a rebuild. Decide before you build, not after a
user asks where their money is.

## Getting a real answer

This is the clearest "pay a lawyer" in the whole pack, and a specialist in
payments or fintech regulation rather than a general practitioner. Bring: what
exactly happens to the money step by step including who holds it and for how
long, which jurisdictions your users are in, whether you take a cut and of
what, and what your processor's own documentation says it permits.

An hour of the right specialist, before you build, is the cheapest thing here.

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

A step-by-step description of where the money sits and who controls it at each
step, the custody question answered yes or no, the jurisdictions named, and
either the processor arrangement chosen or a stated decision to get a
specialist opinion first. A confident "you are probably fine" with no custody
walkthrough is `NOT VERIFIED`, and on this topic that matters more than
anywhere else in the pack.

---
Studio140 · see references/CONTRACT.md
