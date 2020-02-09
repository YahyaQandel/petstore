#### Pet-store system



##### To run the development server
```bash
make start
```

##### To run the tests

```bash
make test
```

#### Challenge 1 steps
```bash
make build
make start
```
###### There is a dump will be loaded after ``make start`` that have default users and pet
##### 1- send `post` request to ``` http://0.0.0.0:8000/v2/pet/1/bid```
`` headers:- ``

`` Authorization: Bearer {user#1 token}``

`` body:-``
``{
    "amount":"320"
  }
``


##### 1- send `Get` request to ``` http://0.0.0.0:8000/v2/pet/1/bid```
`` headers:- ``

`` Authorization: Bearer {user#1 token}``


##### Other endpoints and code that have been implemented only to validate the scenarios and the structure of the pet store
##### Example:- `/v2/oauth/token` to validate that only authenticated users and users who are owners of pets that could list their pets bids