#!make

SHELL = bash

rm-stack:
	- docker stack rm stackdemo $(shell docker service ls -q)

stop-containers:	
	- docker stop $(shell docker ps -a -q)

rm-containers:
	- docker container rm $(shell docker container ls -aq)

rm-volumes:
	- docker volume rm $(shell docker volume ls -q)

deploy:
	docker stack deploy --prune -c docker-compose.yml stackdemo
	
destroy: rm-stack stop-containers
clean: rm-containers rm-volumes