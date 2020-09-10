# Pull official base image
FROM python:3.8.2-slim-buster
# Set work directory
ENV APP_HOME /usr/src/app
WORKDIR ${APP_HOME}
# Set envrionment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONBUFFERED 1
# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs
# confirm that it was successful
RUN node -v
# npm installs automatically
RUN npm -v
# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt
# Copy Configs
COPY ./conf/ /usr/local/etc/jupyter
COPY ./settings/ /usr/local/share/jupyter/lab/settings
# Copy project
COPY nbs/ /usr/src/app/nbs/
RUN jupyter labextension install @karosc/jupyterlab_dracula --no-build && \
    jupyter lab build

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
