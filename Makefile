build:
	docker build --no-cache -t jupyter-analytics -f Dockerfile .

run-sh:
	docker run --rm -it -v "$(PWD)"/nbs:/app/nbs/:z jupyter-analytics /bin/sh

run:
	docker run --rm -it -v "$(PWD)"/nbs:/app/nbs/:z --env PORT=8888 -p 8888:8888 jupyter-analytics
