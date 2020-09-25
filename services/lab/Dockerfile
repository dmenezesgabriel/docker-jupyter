# pull official base image
FROM python:3.8.2-slim-buster
# create the appropriate directories
ENV HOME=/home/
ENV APP_HOME=/home/lab
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
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl git
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs
# confirm that it was successful
RUN node -v
# npm installs automatically
RUN npm -v
# Install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt
# Copy Configs
COPY ./conf/ /usr/local/etc/jupyter
COPY ./settings/ /usr/local/share/jupyter/lab/settings
# Install extensions
RUN jupyter labextension install @karosc/jupyterlab_dracula --no-build && \
    jupyter labextension install @krassowski/jupyterlab-lsp --no-build && \
    jupyter labextension install @ijmbarr/jupyterlab_spellchecker --no-build && \
    jupyter labextension install @jupyterlab/toc --no-build && \
    jupyter labextension install @aquirdturtle/collapsible_headings --no-build && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter lab clean && \
    jupyter lab build --debug && \
    jupyter serverextension enable --py jupyterlab_code_formatter
# Copy entrypoint
COPY scripts/entrypoint.sh $HOME
# run entrypoint.prod.sh
# ENTRYPOINT ["/home/entrypoint.sh"]