
layout: true
class: center, middle, dark

---

# Cohesion, Coupling & Inversion of Control

---

## Cohesion

> TODO 
 
---

## Coupling

> Coupling is the degree of interdependence between software modules; 
> a measure of how closely connected two routines or modules are.

--

### Tight _strong, high_ : **Is bad**

--

### Loose _weak, low_ : **Is good!**


???
- Defines how unit is coupled with others implementation,
- How much code needs to be changed when others implementation changes 

---

### Tight coupling is when bound to: 
### _properties & attributes_

```python
def get_by_email(email: str) -> Union[None, Principal]:
    return Principal.query \
    	.filter(func.lower(Principal.email) == email.lower())
    	.first()
```

???
- Function is coupled by depending on existence of `query` attribute of `Principal` class.

---

### Tight coupling is when bound to:
### _implementation_

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

### Tight coupling is when bound to:
### _structure_

```python
class DefaultLocation:
    @classmethod
    def from_dict(cls, data: Dict) -> DefaultLocation:
        return cls(**data)
```

???
- Static constructor assumes that passed dictionary contains keys

---

### Loose coupling is when there is:
### _abstraction_

- contracts (ie. abstract classes, interfaces)
- data transfer objects
- API

---

## Inversion of Control

---

### What is a dependency?

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

### Injection

> TODO - show how Mailer gets its external dependencies

---

### Decorators

> TODO - circuit breaker is a PROPER decorator

---

### Events

> TODO - no idea how to put this into context

---

### Aspect oriented programming

> TODO - no idea how to put this into context
