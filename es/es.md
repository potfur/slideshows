
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

## Question / Error

**Marker** for `¯\_(ツ)_/¯`

.postit.es.question.big[But how?] 
.postit.es.question.big[Whaaaa!] 

---

## Rule / Policy

Something that is a business related constraint, reaction, trigger etc. 

.postit.es.rule.big[Price >= 40 UAH] 
.postit.es.rule.big[Notify user] 

???

- a constraint, eg. _only one item per customer_
- or something that fork process _apply discount when ..._ 

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
- .postit.es.command[] Command
- .postit.es.actor[] Actor

---

# BDD

---

## Rule

The _thingie_ that we care about

.postit.bdd.rule.big[Discount only for 40+ UAH] 

---

## Case

Specific case for the _thingie_

.postit.bdd.case.big[No discount for 39 UAH] 

---

## Test

- .test.bdd[_Given_ `EventA` _and_ `EventB`]
- .test.bdd[_When_ `CommandA`]
- .test.bdd[_Then_ `EventC`] 

---

- .test.bdd[_Given_ `EventA` _and_ `EventB`]
- .test.bdd[_When_ `CommandA`]
- .test.bdd[_Then_ `EventC`] 


---

- .postit.bdd.rule[] Rule
- .postit.bdd.case[] Case

---

# ? 
