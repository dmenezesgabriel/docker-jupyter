build:
	time docker-compose build

run:
	docker-compose up

lab-shell:
	docker-compose run --rm jupyter-lab /bin/sh
