# pull official base image
FROM python:3.8.2-slim-buster
# create the appropriate directories
ENV HOME=/home/
ENV APP_HOME=/home/notebook
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Set envrionment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONBUFFERED 1
# Define python Language
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
# Install system dependencies
RUN apt-get update
# install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt
# Copy Configs
COPY ./conf/ /usr/local/etc/jupyter
# Copy entrypoint
COPY scripts/entrypoint.sh $HOME
# # run entrypoint.prod.sh
# ENTRYPOINT ["/home/entrypoint.sh"]