# Docker commands
docker-build:
	docker build --rm --no-cache -t jupyter-analytics -f Dockerfile .

docker-run-sh:
	docker run --rm -it -v "$(PWD)"/nbs:/app/nbs/:z jupyter-analytics /bin/sh

docker-run:
	docker run --rm -it -v "$(PWD)"/nbs:/app/nbs/:z --env PORT=8888 -p 8888:8888 jupyter-analytics

# Docker Compose comands
build:
	docker-compose build jupyter-analytics

run:
	docker-compose up jupyter-analytics
