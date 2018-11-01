
layout: true
class: center, middle, bright

---

Event stormin & BDD
===================

---

# ES

---

## Event

Something _important_ happened

.postit.es.event.big[Ad was created] 

---

## Question

**Marker** for `¯\_(ツ)_/¯`

.postit.es.question.big[What happens here?] 

---

## Rule

Some constraint or partition

.postit.es.rule.big[Price >= 40 UAH] 

???

- a constraint, eg. _only one item per customer_
- or something that fork process _apply discount when ..._ 

---

## Policy

Reaction that triggers action

.postit.es.policy.big[Notify user] 

---

## Command

External trigger for action, someone did something.

.postit.es.command.big[Create Ad]
 
---

## Actor

User or external service that triggered command

.postit.es.actor.big[Buyer] 

---

- .postit.es.event[] Event
- .postit.es.question[] Question
- .postit.es.rule[] Rule
- .postit.es.policy[] Policy
- .postit.es.command[] Command
- .postit.es.actor[] Actor

---

# BDD

---

## Rule

_thingie_ that we care about

.postit.bdd.rule.big[Discount only for 40 UAH+] 

---

## Case

Specific case for _thingie_

.postit.bdd.case.big[No discount when 39 UAH] 

---

## Test

### _Given_ `EventA` _and_ `EventB`
### _When_ `CommandA`
### _Then_ `EventC` 

---

- .postit.bdd.rule[] Rule
- .postit.bdd.case[] Case

---

# ? 
