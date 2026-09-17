---
name: solo-compliance
description: "Use when the founder is building for a regulated industry and needs to know what the regulation demands of their actual stack: HIPAA, GDPR, SOC 2, PCI, FERPA, CCPA, and whether they can serve a given customer at all yet. Triggers on 'HIPAA', 'GDPR', 'SOC 2', 'PCI', 'FERPA', 'do I need to worry about [regulation]', 'a customer is asking for a security questionnaire', 'can I store health data', 'enterprise customer wants SOC 2', 'compliance before launch'. Do NOT use for entity formation and standard contracts (solo-legal), for application security implementation (route to a security skill), or for tax obligations (route to an accounting skill)."
---

# Compliance

Not legal advice. This translates regulation into the concrete technical and
contractual things it demands, so you know what it costs before you promise a
customer anything.

## The question that comes first

Does anything actually apply to you yet? Most solo founders either panic early
about a regulation they are not subject to, or discover late that they have
been subject to one for a year. Answer honestly: what data do you hold, whose
is it, where do those people live, and what did you tell your customers you
would do with it.

That last one matters as much as the statutes, because your own Privacy Policy
is an enforceable commitment.

## What each one actually demands

**GDPR and UK GDPR.** Applies if you have users in the EU or UK, regardless of
where you are. Demands a lawful basis for processing, real deletion and export
on request, breach notification within a tight window, and data processing
agreements with your subprocessors. Practically: know every vendor that touches
user data, be able to delete a user completely, and mean what your policy says.

**CCPA and its successors.** Similar shape for California residents, with
thresholds. Deletion and disclosure rights, and no dark patterns in consent.

**HIPAA.** Applies if you handle protected health information for a covered
entity. Demands a Business Associate Agreement with you and with every vendor
in the chain, audit logging, encryption, and access controls. Most default
hosting and analytics stacks are not eligible without a signed BAA, and this is
the specific thing that catches people: your error tracker and your analytics
see the data too.

**PCI DSS.** Applies if card data touches your systems. The correct move is to
never let it, by using hosted checkout, which reduces your obligation to a
short self-assessment instead of an audit.

**FERPA.** Student education records, usually via a contract with the
institution. The obligation typically arrives through the contract, so read it.

**SOC 2.** Not a law. An audit that enterprise buyers ask for. Costs real money
and months, and needs controls running for an observation window before the
report exists. Do not start it before a customer with budget has said it is the
blocker, and when they do, price it into that deal.

## When a questionnaire arrives

A security questionnaire from a prospect is a sales document. Answer truthfully,
say "not yet, here is our plan and date" where it applies, and never claim a
certification you do not hold. That claim is discoverable and fatal to the deal
and possibly worse.

## Reversibility

Architecture chosen to satisfy a regulation is expensive to retrofit,
particularly data residency, audit logging, and deletion. If you intend to
serve a regulated segment, decide before you build, not after a customer asks.

## Evidence

A statement of which regimes apply with the reason, a vendor list showing which
touch user data and which have the required agreement in place, and for any
claimed control, the artifact that proves it. A claimed certification without
a report is a fail.

---
140.studio · soloagency v0.1 · see references/CONTRACT.md
