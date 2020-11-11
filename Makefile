build:
	time docker-compose build

run:
	NOTEBOOKS_PATH="../notebooks" docker-compose up -d

lab-shell:
	docker-compose run --rm jupyter-lab /bin/sh

down:
	docker-compose down -v

# Raspberry pi
build-pi:
	time docker-compose -f docker-compose.pi.yml build jupyter-lab

run-pi:
	NOTEBOOKS_PATH="../notebooks" docker-compose -f docker-compose.pi.yml up -d jupyter-lab

down-pi:
	docker-compose -f docker-compose.pi.yml down

