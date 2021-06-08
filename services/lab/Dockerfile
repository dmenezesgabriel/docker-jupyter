# pull official base image
FROM python:3.9.5-slim-buster

# Set envrionment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1

# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONBUFFERED 1

# Virtual environment
ENV VIRTUAL_ENV=/opt/venv

# create the appropriate directories
ENV HOME=/home
ENV APP_HOME=/home/lab
RUN mkdir $APP_HOME

# Install system dependencies
RUN set -ex && \
    apt-get update && apt-get install --no-install-recommends -y \
    curl \
    git \
    vim \
    zsh \
    python3-venv

# Create venv
RUN python3 -m venv $VIRTUAL_ENV

# Activate virtualenv
ENV PATH="${VIRTUAL_ENV}/bin:$PATH"

# Install Oh my Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set workdir
WORKDIR $APP_HOME

# Install python dependencies
RUN pip3 --no-cache install --upgrade pip setuptools wheel
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip3 --no-cache install -r /usr/src/app/requirements.txt

# Copy Configs
COPY ./configs/pycodestyle /home/.config/pycodestyle
COPY ./configs/jupyter_notebook_config.py /home/.jupyter/jupyter_notebook_config.py
COPY ./configs/jupyter_notebook_config.json /usr/local/etc/jupyter/jupyter_notebook_config.json
COPY ./configs/overrides.json /usr/local/share/jupyter/lab/settings/overrides.json
