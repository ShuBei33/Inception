COMPOSE	= docker-compose -f ./srcs/docker-compose.yml

all:
	make build
	make up

help:
		@echo "\n"
		@echo "---------------------------------------------------------------------------------"
		@echo "- make		  -> build the image from Dockerfile + create + start containers"
		@echo "- make build	  -> build the image from Dockerfile"
		@echo "- make up	  -> create + start containers"
		@echo "- make ps	  -> display containers state"
		@echo "- make ps logs	  -> display containers state + logs"
		@echo "- make start/stop -> start or stop containers"
		@echo "- make down	  -> stop and remove containers"
		@echo "- make destroy	  -> down + clean volumes"
		@echo "- make restart	  -> stop + up\n"
		@echo "note: <make> <option> c=<container's name> to apply to only one container"
		@echo "---------------------------------------------------------------------------------\n"

build:
	$(COMPOSE) build $(c)
#build the image from Dockerfile

up:
	$(COMPOSE) up -d $(c)
#create and start containers

start:
	$(COMPOSE) start $(c)
#start all the containers

ps logs:
	$(COMPOSE) $@ $(c)

down:
	$(COMPOSE) down $(c)
#stop and remove containers

destroy:
	$(COMPOSE) down -v $(c)

stop:
	$(COMPOSE) stop $(c)
#stop the containers

restart: stop build up

fclean:
	docker volume prune --force


re: down fclean up

.PHONY: build up start ps logs down destroy stop restart fclean re