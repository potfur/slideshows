
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
.postit.es.question.big[When!?] 

---

## Rule / Policy

Something that is a business related constraint, condition, that will divide process.

.postit.es.rule.big[Price >= 40$] 
.postit.es.rule.big[Notify user] 

???

- a constraint, eg. _only one item per customer_
- or something that fork process _apply discount when ..._ 

---

## Command

A trigger, cause for action, a reason why something happens.

.postit.es.command.big[Create Ad]
 
---

## Actor

A user or a service that causes commands.

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

The _thing_ that we care about

.postit.bdd.rule.big[All tests must be green] 

---

## Case

Specific cases for the _thing_

.postit.bdd.case.big[Unit tests failed]
.postit.bdd.case.big[Unit tests passed]

---

## Test

- .test.bdd[_Given_ `UnitTestsPassed` _and_ `IntegrationTestsPassed`]
- .test.bdd[_When_ `DeployOnStaging`]
- .test.bdd[_Then_ `DeployedOnStaging`] 

---

- .postit.bdd.rule[] Rule
- .postit.bdd.case[] Case

---

# ? 
