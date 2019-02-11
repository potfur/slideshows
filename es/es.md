
layout: true
class: center, middle, bright

---

Event Storming
==============

---

## What is it?

_Event storming is a workshop-based method to quickly find out what is happening in the domain of a software program._

[Wiki](https://en.wikipedia.org/wiki/Event_storming)


---

## It is a way that...

---

Allows with help of **Post Its** transfer AND/OR share _understanding_ about _business_ from people that know it to people that will eventually implement it.

???

- so people know how and when stuff happens,
- and they use the same vocabulary when talking about it,
- and all the _that's obvoius_ things are clear,

---

Aids _process_ modeling, and helps to find all ambiguities, unknown conditions, and unexplored paths _before_ any line of code is written.

???

- so a process can be validated before it gets written,
- to clearly define what, why and when

---

Helps to spot limits of responsibility, _context boundaries_ - or simply put - how to split stuff into separate services before they get written

???

- so it is more ordered, not everything everywhere,
- not to end with a ball of mud

---

## How?

---

## Get a room:

- with a _loooooooooooong_ wall,
- big _roll of paper_ - for the wall,
- lots of **post its** in different colors

---

## Get people:

- _That know stuff_ : domain experts, product, etc.,
- _That do stuff_ : frontend, backend, whatever-end

???

- put important people in a room, throw some paper and bag of postits and wait for last one standing,

---

## Tell them to Put _Post Its_  On _The Wall_

---

Start with one **event**, that states that something important just happened.

.postit.es.event.big[Ad Created] 

Let everyone add events that they think that lead to it or stuff that happens after.

`TODO - example for event stream starting from "ad created"`

---

### Question / Error

**Marker** for `¯\_(ツ)_/¯`

.postit.es.question.big[But how?] 
.postit.es.question.big[When!?] 

`TODO - example for event stream with question eg. what happens when moderation fails`

---

### Rule / Policy

Something that is a business related constraint, condition, that will divide process.

.postit.es.rule.big[Price >= 40$] 
.postit.es.rule.big[Notify user] 

???

- a constraint, eg. _only one item per customer_
- or something that fork process _apply discount when ..._ 

`TODO - example for event stream with question replaced by rule/policy and new path`

---

### Command

A trigger, cause for action, a reason why something happens.

.postit.es.command.big[Create Ad]

`TODO - add command "fill form" that triggers "ad created"`
 
---

### Actor

A user or a service that causes commands.

.postit.es.actor.big[Buyer] 

`TODO - add "who does it" to "fill form"`