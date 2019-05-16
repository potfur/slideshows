
layout: true
class: center, middle, bright

---

Delivery
========

---

# What is `Delivery`

- top level flow: `posting`, `selling`, `buying`
- basic vocabulary: `ad`, `delivery`, `purchase`, `confirmation`

---

## _old_ flow

- what it was (and kind of still is)
- legacy that we needed to support and roll with it

---

## _new_ flow

- what it is
- main differences (flow)

---

## Apps

- defining API contracts from beginning,
- separating new logic from existing
- ?MORE?

---

## Front end

- working with legacy,
- communicating with services via Atlas as proxy,
- ?MORE?

---

## Atlas

- Authorization
- Acting as proxy
- Internal communication

---

## K8S

- ?MORE?

---


# Services: From top to bottom

- _context_ - big picture view over services
- _containers_ - system boundaries, a runnable/deployable unit
- _components_ - major building blocks of containers, bounded context
- _code_ - how the actual code is organised

---

# Context

_picture showing `UARock` and `Price` together_
_`Atlas` and `UAPay` included_

---

## UARock: containers

containers involved in UARock, named by function not by technology

---

## UARock: components

- ad
- transaction
- user
- location

---

## UARock: code

---

### Hexagonal architecture

- application -> domain -> infrastucture

---

### CQRS

- commands and command handlers
- queries (aka criteria) and query handlers
- DTO

---

### DDD basics

- entities
- value objects
- repositories (ORM)

---

### Event processing

- Logs
- Synchronisation

---

# Monitoring

---

## NewRelic

- APM
- Insights

---

## Sentry

- Exceptions

---

## Logz.io

- Traffic

---

## SignalFX

- Infrastructure

---

# What wen well
# _and what not_

- _+_ Feature toggles
- _+_ CQRS!!!!!111111
- _+_ Postgres + JSON
- _+_ Redis -> SQS.FIFO
- _+_ Tests, tests, tests
- `-/+` KAAS
- `-` Lack of INFRA & FE from start
- `-` API Calls
- `-` SLA (Objectives + Indicators)
- `-/+` Laquesis: experiments instead feature flags
- ?MORE?