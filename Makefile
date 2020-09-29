build-lab:
	time docker-compose build jupyter-lab

run-lab:
	docker-compose up jupyter-lab

lab-sh:
	docker-compose run --rm jupyter-lab /bin/sh

build-notebook:
	time docker-compose -f docker-compose.notebook.yml build jupyter-notebook

run-notebook:
	docker-compose -f docker-compose.notebook.yml up jupyter-notebook
