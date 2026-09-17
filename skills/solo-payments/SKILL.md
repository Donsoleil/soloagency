---
name: solo-payments
description: "Use when the founder needs to actually take money: setting up Stripe or another processor, implementing subscriptions and plan changes, handling failed payments and dunning, refunds, invoicing, sales tax and VAT collection, or diagnosing why revenue is leaking. Triggers on 'set up Stripe', 'how do I charge people', 'subscriptions', 'failed payment', 'dunning', 'chargeback', 'do I need to collect sales tax', 'VAT', 'why did this customer not renew', 'my revenue doesn't match my customer count'. Do NOT use for deciding the price or tier structure (solo-pricing), for checkout page copy and layout (solo-conversion), or for bookkeeping and month-end close (route to an accounting skill)."
---

# Payments

Two jobs: money arrives reliably, and you can tell where it went. The second
job is the one that gets skipped and it is the one that costs you.

## Read first

If a payments connector is live, pull the real state before advising: active
subscriptions by plan, failed payment count in the last 30 days, involuntary
versus voluntary churn split, refund rate, and any dispute history. The gap
between what a founder thinks is happening and what the dashboard says is
usually large and usually in the failed-payment column.

## The setup that holds up

Use a hosted processor and its hosted checkout. Do not build a card form, do
not store card data, and do not let an AI coding tool talk you into either.
Hosted checkout also inherits their fraud handling and their compliance
surface, which you do not want to own.

Webhooks are the part everyone gets wrong. Your database learns about a payment
from the webhook, not from the browser redirect, because the browser can be
closed mid-flow. Make handlers idempotent: the same event arriving twice must
not create two subscriptions or send two emails. Test with replayed events, not
just a happy-path purchase.

Keep one canonical subscription state in your own database, synced from
webhooks, and read that for access decisions rather than calling the processor
on every request.

## Failed payments are your biggest leak

Involuntary churn, meaning cards expiring and payments failing, is commonly a
large share of total churn and it is the cheapest to fix because those
customers still want the product. Turn on smart retries, send the dunning
emails, and give a one-click update-card link that does not require logging in.
Measure recovery rate and treat it as a real metric.

## Refunds

Give them quickly and without interrogation below a threshold you set in
advance. A fast refund costs less than a dispute, which costs a fee plus your
processor standing. Set the threshold now, before you are annoyed at someone.

## Tax

Sales tax, VAT, and GST depend on where your customer is, not where you are,
and thresholds change. Use the processor's tax product or a dedicated service
rather than hand-rolling rates. This is a real liability that compounds
quietly, so get it on from the start rather than retrofitting.

Not tax advice. Once you have revenue in multiple jurisdictions, this is a
conversation with an accountant, and `solo-compliance` covers what to bring.

## Reversibility

Test-mode work is reversible. Anything touching a live customer's card or
billing cycle is not, so run it in test mode first, every time.

## Evidence

A test-mode transaction completing end to end with your database reflecting it,
an idempotency test with a replayed webhook, and current failed-payment and
recovery numbers from the connector. Prose descriptions of the flow are
`NOT VERIFIED`.

---
Studio140 · soloagency v0.1 · see references/CONTRACT.md
