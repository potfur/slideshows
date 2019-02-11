
layout: true
class: center, middle, dark

---

Cohesion, Coupling & IoC
========================

---

## What is wrong with this example?

```python
class Notifications:
	@circuitbreaker(expected_exception=Exception)
	def send(recipient_id: int) -> str:
		user = db.connection.query.filter(User.id == recipient_id).one()
		payload = {'address': user.email, 'name': user.name}
	    response = requests.post(os.getenv['URL'],  json=payload)
		return response.json()['id']
```

???

- low cohesion
- `query` - quering for user 
- coupling
- `os.getenv['URL']` - env var
- `User.id` - implementation detail
- `db.connection.query` - coupled with db connection
- dependency implementation
- `circuitbreaker` - hardcoded decorator
- `db.connection` - import form global scope

---

# Cohesion

> [Cohesion][cohesion] refers to the degree to which the elements inside a module`*` belong together.
_`*`module_ as in: package, module, file, class


#### exception handling
```python
@circuitbreaker(expected_exception=Exception)
def func(): ...
```

#### quering for user
```python
user = db.connection.query.filter(User.id == recipient_id).one()
```

---

# Coupling
 
> [Coupling][coupling] is the degree of interdependence between software modules; 
> a measure of how closely connected two routines or modules are.

#### coupled with database & User properties
```python
user = db.connection.query.filter(User.id == recipient_id).one()
```

#### coupled with environment variable
```python
response = requests.post(os.getenv['URL'],  json=payload)
```

---

# Inversion of Control

> [Inversion of control][ioc] addresses a component’s dependency resolution,
> configuration, and lifecycle - they should not be the concern of the component itself.

#### controls how exceptions are handled
```python
@circuitbreaker(expected_exception=Exception)
```

#### controls how to access users
```python
user = db.connection.query.filter(User.id == recipient_id).one()
```

#### controls to where send requests
```python
response requests.get(os.getenv['URL'], params=params)
```


---

### Dependency injection

```python
class Notifications:
 	def __init__(self, dispatcher: EventDispatcher):
 		self.dispatcher = dispatcher
 
 	@circuitbreaker(expected_exception=Exception)
	def send(user: User) -> str:
		payload = {'address': user.email, 'name': user.name}
	    response = requests.post(os.getenv['URL'],  json=payload)
		return response.json()['id']
```

---

### Events

```python
class Notifications:
 	def __init__(self, dispatcher: EventDispatcher):
 		self.dispatcher = dispatcher
 
 	@circuitbreaker(expected_exception=Exception)
 	def send(self, user: User) -> str:
 		event = NotificationRequested(user)
 	    self.dispatcher.publish(event)
 	    return event.message_id
```

---

### Decorator

```python
# introducing abstract base class
class Notifications(ABC):
	...

# renaming Notifications to QueuedNotifications
class QueuedNotifications(Notifications):
	...

class NotificationCircuitBreaker(Notifications):
	def __init__(self, notifications: Notifications) -> None:
		self.notifications = notifications
		
	def send(self, , user: User) -> str:
		try:
		    return self.notofications.send(user_id)
		except Exception as e:
			...
```

---

## Result

```python
class Notifications(ABC):
	...

class QueuedNotifications(Notifications):
 	def __init__(self, dispatcher: EventDispatcher):
 		self.dispatcher = dispatcher
 
 	def send(self, user: User) -> str:
 		event = NotificationRequested(user)
 	    self.dispatcher.publish(event)
 	    return event.message_id

class NotificationCircuitBreaker(Notifications):
	def __init__(self, notifications:Notifications) -> None:
		self.notifications = notifications
		
	def send(self, , user: User) -> str:
		try:
		    return self.notofications.send(user_id)
		except Exception as e:
			...
```

???

---

# ?

[cohesion]: https://en.wikipedia.org/wiki/Cohesion_(computer_science)
[coupling]: https://en.wikipedia.org/wiki/Coupling_(computer_programming)
[ioc]: http://picocontainer.com/inversion-of-control.html
