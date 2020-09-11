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
# Copy notebooks folder
COPY nbs/ /usr/src/app/nbs/
# Copy entrypoint
COPY scripts/entrypoint.sh /usr/src/app/entrypoint.sh
# Install extensions
RUN jupyter labextension install @karosc/jupyterlab_dracula --no-build && \
    jupyter labextension install @krassowski/jupyterlab-lsp --no-build && \
    jupyter labextension install @ijmbarr/jupyterlab_spellchecker --no-build && \
    jupyter labextension install @jupyterlab/toc --no-build && \
    jupyter labextension install jupyterlab-drawio --no-build && \
    jupyter labextension install @aquirdturtle/collapsible_headings --no-build && \
    jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build && \
    jupyter lab build
# Give permissions
CMD ["chmod", "+x", "/usr/src/app/entrypoint.sh"]
# Run entrypoint
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]