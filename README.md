#### Pet-store system



##### prerequisites 
```bash
install docker
ubuntu :-
https://docs.docker.com/install/linux/docker-ce/ubuntu/

mac:-
https://docs.docker.com/docker-for-mac/install/

```

##### Run tests

```bash
make test
```

##### Build

```bash
make test
```

#### Challenge 1 steps
```bash
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
##### Example:- `/v2/oauth/token` to validate that only authenticated users and users who are owners of pets that could list their pets bids and i really enjoyed it.



#### Challenge 2 steps 
##### Path ` petstore/auction/`
##### Run the tests 
```bash
make test
```
The tests simulates the input and output for the script.
if you have a specific (new) case you will need to update `auction/case4/input.txt` and `auction/case4/expected-output.txt` files 
for input and output ( check other cases in the same directory for clarification ).