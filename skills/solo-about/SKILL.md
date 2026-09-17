---
name: solo-about
description: "Creates and maintains ABOUT.md, the founder context file the rest of soloagency reads so it stops asking the same questions every session. Use when starting with soloagency for the first time, when the founder says 'set up my profile', 'tell you about my business', 'stop asking me this', 'save my context', 'update my profile', or when another skill needs founder facts that are not in the conversation. Do NOT use for customer or segment profiles (solo-customer-research owns those), for brand and visual identity, or for anything a connector can answer live."
---

# solo-about

Write once, read by everything. The file lives at `ABOUT.md` in the project
root so it travels with the work and stays under version control.

## What goes in it

Only durable facts. The test: will this still be true in three months?

- **Who you are.** Background, and specifically the industry you have standing
  in, because `solo-niche-advantage` keys off it.
- **The business.** What it is, what stage, entity if formed, where you operate.
- **The customer,** one line, pointing at the fuller profile if one exists.
- **The money shape.** What you charge for and roughly the model, not live
  numbers.
- **Your floor.** The income the business needs to produce, and by when. This
  single number changes almost every recommendation in the pack and almost
  nobody writes it down.
- **Hours available per week.** Honestly. A plan built for 40 hours handed to
  someone with 8 is not a plan.
- **Constraints.** Things that are fixed: a regulated industry, a partner, a
  language, a platform you will not leave.
- **Voice.** How you want writing to sound, with a sample of your own.

## What stays out

Anything a connector can answer live: current revenue, customer count, plan
distribution, traffic. Those go stale inside a week and a stale number in a
context file is worse than no number, because it gets used.

Also out: aspirations stated as facts. "We serve enterprise customers" when you
have three sole traders is a lie you will then be given advice against.

## Format

Markdown, headings above, short. Under 400 words. Longer files stop being read,
by people and by models.

Date the file. Review it when the stage changes, not on a schedule.

## Updating

Change the line, note what it was. History matters: "flat pricing, previously
per seat" tells the next reader something a bare current value does not.

## How other skills use it

They read it, they do not re-ask. If a skill is asking you something ABOUT.md
already answers, that is a bug in the skill, not in your file.

## Evidence

The file exists at a stated path, under 400 words, with a date, and with the
income floor and hours-per-week both filled in. Those two blank means
`NOT VERIFIED`, because they are the two that change the advice most.

---
140.studio · see references/CONTRACT.md
