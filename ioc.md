
layout: true
class: center, middle, inverse

---

# Cohesion, Coupling & Inversion of Control

---

# Cohesion

> TODO 
 
---

# Coupling

> Coupling is the degree of interdependence between software modules; a measure of how closely connected two routines or modules are.

???
- Defines how unit is coupled with others implementation,
- How much code needs to be changed when others implementation changes 

---

## Tight _strong, high_
Is bad.

--

## Loose _weak, low_
Is good!

---

### Properties & attributes

```python
def get_by_email(email: str) -> Union[None, Principal]:
    return Principal.query \
    	.filter(func.lower(Principal.email) == email.lower())
    	.first()
```

???
- Function is coupled by depending on existence of `query` attribute of `Principal` class.

---

### Implementation

```python
class NotificationRepository:
	...

class CreateNotificationHandler:
    def __init__(self, notifications: NotificationRepository):
    	...
```

???
- Handler expects specific implementation

---

### Structure

```python
class SetDefaultLocation(object):
    @classmethod
    def from_dict(cls, data: Dict):
        return cls(**data)
```

???
- Static constructor assumes that passed dictionary contains keys

---

## Abstractions

- contracts (ie. abstract classes, interfaces)
- data transfer objects
- API

---

# Inversion of Control

---

## What is a dependency

--

```python
class Mailer:
	@circuitbreaker(expected_exception=Exception)
	def send(user_id: int) -> bool:
		repository = UserRepository(orm.connection.engine)
		user = repository.get_by_id(user_id)
		payload = {
			'address': user.email,
			'name': user.name
		}
	    headers = {
	    	'User-Agent': '%s(%s)' % (version, socket.gethostname())
	    	'Authorization': os.getenv('NOTIFICATION_AUTH')
	    }
	    return requests.post(
	    	app.config['NOTIFICATION_URL'], 
	    	json=payload, 
	    	headers=headers
		).ok
```

--

`circuitbreaker`, `orm.connection.engine`, `UserRepository`, `version`, `socket.gethostname`, `os.getenv`, `requests`

---

.mermaid[graph LR A-->B B-->C C-->A D-->C]

---

## Injection

> TODO - show how Mailer gets its external dependencies

---

## Decorators

> TODO - circuit breaker is a PROPER decorator

---

## Events

> TODO - no idea how to put this into context

---

## Aspect oriented programming

> TODO - no idea how to put this into context
