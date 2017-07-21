
layout: true
class: center, middle, dark

---

Cohesion, Coupling & IoC
========================

---

# Cohesion

> [Cohesion][cohesion] refers to the degree to which the elements inside a module`*` belong together.

_`*`module_ as in: package, module, file, class
 
---

```python
order = {
	...
	'price_gross': 100,
	'price_net': 120,
	'price_currency': 'EUR',
	...
}

def set_price(order: dict, gross: int, net: int, curr: str) -> None:
	order['price_gross'] = gross
    order['price_net'] = net
    order['price_currency'] = curr

def set_shipping_address(...) -> None:
	...

```

---


```python
class Order
	def set_price(self, gross: int, net: int, curr: str) -> None:
        self.__price_gross = gross
        self.__price_net = net
        self.__price_currency = curr
        
	def set_shipping_address(self, ...) -> None:
		...
```

---

```python
class Order
	def set_price(self, price: Price) -> None:
        self.__price = price
        
	def set_shipping_address(self, address: Address) -> None:
		self.__shipping_address = address
```

---


# Coupling

> [Coupling][coupling] is the degree of interdependence between software modules; 
> a measure of how closely connected two routines or modules are.

--

## Tight _strong, high_ : **Is bad**

--

## Loose _weak, low_ : **Is good!**


???
- Defines how unit is coupled with others implementation,
- How much code needs to be changed when others implementation changes 

---

## Tight coupling is when bound to: 
## _properties & attributes_

```python
def get_by_email(email: str) -> Union[None, Principal]:
    return Principal.query \
    	.filter(func.lower(Principal.email) == email.lower())
    	.first()
```

???
- Function is coupled by depending on existence of `query` attribute of `Principal` class.

---

## Tight coupling is when bound to:
## _implementation_

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

## Tight coupling is when bound to:
## _structure_

```python
class DefaultLocation:
    @classmethod
    def from_dict(cls, data: Dict) -> DefaultLocation:
        return cls(**data)
```

???
- Static constructor assumes that passed dictionary contains keys

---

## Loose coupling is when there is:
## _abstraction_

- contracts (ie. abstract classes, interfaces)
- data transfer objects
- API

---

# Inversion of Control

> [Inversion of control][ioc] is a programming technique, expressed here in terms of object-oriented programming, 
> in which object coupling is bound at run time by an assembler object and is typically not known 
> at compile time using static analysis. 

---

## What is a dependency?

```python
class Mailer:
	@circuitbreaker(expected_exception=Exception)
	def send(self, user_id: int) -> bool:
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

`Mailer` 🡲 `UserRepository` 🡲 `orm.connection.engine`

---

`Mailer` 🡲 [`Users`]() 🡰 `UserRepository` 🡲 `orm.connection.engine`

---

## Injection

```python
class Mailer:
	def __init__(self, url: str, headers: dict, users: Users) -> None:
		self.__url = url
		self.__headers = headers
		self.__users = users

	@circuitbreaker(expected_exception=Exception)
	def send(self, user_id: int) -> bool:
		user = self.__users.get_by_id(user_id)
		payload = {
			'address': user.email,
			'name': user.name
		}
		self.__headers
	    return requests.post(self.__url, json=payload, headers=headers).ok
```

---

## Decorators

```python
class MailerCircuitBreaker:
	def __init__(self, mailer=Mailer) -> None:
		self.__mailer = mailer
		
	def send(self, user_id: int) -> bool:
		try:
		    return self.__mailer.send(user_id)
		except Exception as e:
			...
```

---

## Events

> TODO - no idea how to put this into context

---

## Aspect oriented programming

> TODO - no idea how to put this into context

---

# ?

[cohesion]: https://en.wikipedia.org/wiki/Cohesion_(computer_science)
[coupling]: https://en.wikipedia.org/wiki/Coupling_(computer_programming)
[ioc]: https://en.wikipedia.org/wiki/Inversion_of_control
