build-lab:
	time docker-compose build jupyter-lab

run-lab:
	docker-compose up jupyter-lab

build-notebook:
	time docker-compose build jupyter-notebook

run-notebook:
	docker-compose up jupyter-notebook
