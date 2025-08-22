# Drug Effect

## About

This example app does one feature: lists the drugs from the FDA, and allows you to filter by serious side effects (as reported).

## Installation

1. Add your OpenFDA.gov API key to adverse_effects_controller, Line 4, [Insert Your Key Here]
2. On the command line, in the directory of this repository, run `bundle exec rails s`
3. In a browser, access "localhost:3000"

No database setup required as this pulls directly from the API.

## TODO
- Included a branch 'manufacturers' for an in progress  work on stacked rank list of manufacturers with serious adverse effects reports.

## Tradeoffs you made, Technical decisions
I did not do tests in this, I usually love TDD but decided not to. Not sure that was the right decision.

I debated Python or Rails, and decided I liked the view work on Rails better than python for this, ti makes a pretty quick web site, etc. I do like brevity of Pythona and better data and http handling.

I decided not to load a database, and do it all in view/controller. This was a decision on getting some results fast to play with. I didn't rule it out but doing a data model would have taken longer, and I wasn't 100% on the FDA data coming back yet. Working thorugh a live result would have familiarized myself enough to get it working operationally. I wasn't sure I'd have time for hte other features- and I didn't- so glad I didn't spend time on the model. 

## Improvements

Pagination for sure. I would read more from the API and provide an idea of how many more results.
Finishing the features. Once I had the scaffolding it was easier to go, but I was was thinking through some basic stuff on a Greenfield project which always throw me a loop. Once i have something it's much faster.
