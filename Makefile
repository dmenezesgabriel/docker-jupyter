build-lab:
	time docker-compose build jupyter-lab

run-lab:
	docker-compose up jupyter-lab

lab-sh:
	docker-compose run --rm jupyter-lab /bin/sh

build-notebook:
	time docker-compose build jupyter-notebook

run-notebook:
	docker-compose up jupyter-notebook
