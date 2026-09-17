# soloagency roadmap

Shipped in slices so each release is usable on its own.

## v0.1 — Business (this release)
Decide what to sell, to whom, for how much, how to get paid, and how to stay
legal. 13 skills, no orchestration. You invoke them by name.

Lanes and their skills:
- **Validate** — solo-customer-research, solo-market-research, solo-validate, solo-niche-advantage
- **Money** — solo-pricing, solo-payments, solo-conversion
- **Launch and grow** — solo-landing-page, solo-launch, solo-growth, solo-community
- **Floor** — solo-legal, solo-compliance

## v0.2 — Orchestration and prompt routing
- `soloagency` front desk: classify the ask, bind a lane, set the loop budget and exit condition
- `solo-brief`: turns a rough ask into a prompt an agent can actually run, against a founder rubric
- `solo-receipts`: the evidence gate, cut to what one person can produce
- `solo-about`: founder context file so the other skills stop asking the same questions

## v0.3 — Teams, graph, loops
- Ordered crews per lane rather than one skill at a time
- Graph run with a merge step and an independent checker
- Standing loops: weekly money check, monthly trajectory check

## v0.4 — Research, UX, design, product
- solo-prioritize, solo-translate, solo-brand, solo-go-live, and the discovery
  and interface skills that belong to a lane rather than a one-off

## Versioning
Each release bumps the minor version and stays additive. A skill never changes
name after it ships.
