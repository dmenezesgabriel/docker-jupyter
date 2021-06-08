build:
	docker-compose build

run:
	docker-compose up -d

psswd:
	docker-compose run --rm jupyter-lab ipython -c "from notebook.auth import passwd; passwd()"

lab-shell:
	docker-compose run --rm jupyter-lab /bin/sh

down:
	docker-compose down -v
