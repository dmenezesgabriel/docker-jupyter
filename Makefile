build-lab:
	time docker-compose build

run-lab:
	docker-compose up

lab-shell:
	docker-compose run --rm jupyter-lab /bin/sh

build-classic:
	time docker-compose -f docker-compose.classic.yml build

run-classic:
	docker-compose -f docker-compose.classic.yml up

classic-shell:
	docker-compose -f docker-compose.classic.yml run --rm jupyter-classic /bin/sh