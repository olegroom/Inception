COMPOSE=docker-compose -f srcs/docker-compose.yml

pre:
	mkdir -p /tmp/data/db /tmp/data/wp
# run containers: 1) --build with build images before start container 2) -d in detach mode
all:
	$(COMPOSE) up --build -d
images:
	$(COMPOSE) images
ps:
	$(COMPOSE) ps
# build: 1) -q no output
build:
	$(COMPOSE) build
run:
	$(COMPOSE) up -d
# deleting: 1)networks in networks section 2) containers
down:
	$(COMPOSE) down
# deleting:  1)networks in networks section 2) containers 3) volumes
down2:
	$(COMPOSE) down -v
# deleting: as before + images
down3: down2
	$(COMPOSE) down --rmi all
re: down3 delFolder pre all

delFolder:
	rm -rf /tmp/data
ng:
	docker exec -it nginx bash