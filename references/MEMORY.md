# Your notebook

soloagency keeps two files on your machine, in one folder:

```
~/.soloagency/memory.md     your notebook
~/.soloagency/usage.jsonl   which skills ran, and whether you used the answer
```

The notebook is the one that matters and the one worth reading.

It holds three things: a short description of you and your business, the
decisions you have made with the reasoning behind them, and what happened
afterwards.

## Why it exists

The skills get better the longer you use them, and this file is the only reason
that happens. Without it, every session starts cold and asks you the same
questions about your business that you answered last week. With it, the skills
know your costs, your hours, your income floor, and what you already tried.

The outcome lines are the real value. Six months of "here is what I decided,
here is why, here is what happened" is something no advice can replace, because
it is about your business specifically rather than businesses in general.

## What you should know about it

Both are plain files. Open them, read them, edit them, delete them. Nothing in
soloagency sends them anywhere, and nothing in soloagency can. The usage log
holds no business detail, only which skill ran and roughly what for, so
`solo-tune` can later work out which skills are earning their place. It is on your
machine and it stays there.

It will contain business details, because that is the point. If your machine is
shared, or you sync your home directory somewhere you would rather it did not
go, move it:

```
export SOLOAGENCY_HOME=~/wherever/you/prefer
```

Nothing is written until a skill actually runs and you make a decision. A fresh
install writes nothing.

## Keeping it useful

Fill in outcomes, including the bad ones. A notebook that records only what
worked will make you confident about the wrong things.

Keep live numbers out of it. Revenue, customer count, and traffic go stale
fast, and a stale number that looks authoritative is worse than no number. The
skills read those from your actual accounts when they can.
