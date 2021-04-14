ifneq (,$(wildcard ./.env.host))
    include .env.host
    export
endif

build:
	NOTEBOOKS_PATH=$(NOTEBOOKS_PATH) time docker-compose build

run:
	NOTEBOOKS_PATH=$(NOTEBOOKS_PATH) docker-compose up -d

psswd:
	NOTEBOOKS_PATH=$(NOTEBOOKS_PATH) docker-compose run --rm jupyter-lab ipython -c "from notebook.auth import passwd; passwd()"

lab-shell:
	NOTEBOOKS_PATH=$(NOTEBOOKS_PATH) docker-compose run --rm jupyter-lab /bin/sh

down:
	NOTEBOOKS_PATH=$(NOTEBOOKS_PATH) docker-compose down -v
