build:
	time docker-compose build

run:
	NOTEBOOKS_PATH="../notebooks" docker-compose up -d

lab-shell:
	docker-compose run --rm jupyter-lab /bin/sh

