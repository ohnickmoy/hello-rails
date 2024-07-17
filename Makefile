## Some systems have older versions of docker on their machine, hence the check for docker compose or docker-compose
DOCKER_COMPOSE_CMD := $(shell if docker compose version > /dev/null 2>&1; then echo "docker compose"; else echo "docker-compose"; fi)

preflight-check:
	@echo "Check to see if you have pre-requisites on your machine"
	@if command -v docker > /dev/null 2>&1; then \
    echo "Docker is installed"; \
	else \
		echo "Docker is not installed. Please install docker"; \
	fi

build:
	@echo "Building environment..."
	$(DOCKER_COMPOSE_CMD) build

up:
	@echo "Starting up the enviroment..."
	$(DOCKER_COMPOSE_CMD) up

down:
	@echo "Spinning down the environment..."
	$(DOCKER_COMPOSE_CMD) down

