build-lab:
	time docker-compose build jupyter-lab

run-lab:
	docker-compose up jupyter-lab

lab-sh:
	docker-compose run --rm jupyter-lab /bin/sh