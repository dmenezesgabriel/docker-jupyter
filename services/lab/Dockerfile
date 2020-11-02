# pull official base image
FROM python:3.8.2-slim-buster

# Set envrionment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1

# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONBUFFERED 1

# Define python Language
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install dependencies
RUN apt-get update && apt-get install -y wget curl unzip gnupg2
# Adding trusting keys to apt for repositories
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# Adding Google Chrome to the repositories
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Install system dependencies
RUN apt-get update && apt-get install -y \
    google-chrome-stable

# Download the Chrome Driver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip

# Unzip the Chrome Driver into /usr/local/bin directory
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# Set display port as an environment variable
ENV DISPLAY=:99

# create the appropriate directories
ENV HOME=/home
ENV APP_HOME=/home/lab
RUN mkdir $APP_HOME

# Install system dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl git vim zsh tree

# Install Oh my Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
RUN chsh -s $(which zsh)

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs

# confirm that it was successful
RUN node -v

# npm installs automatically
RUN npm -v

# Set workdir
WORKDIR $APP_HOME

# Install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt

# Copy Configs
COPY ./configs/jupyter_notebook_config.py /home/.jupyter/jupyter_notebook_config.py
COPY ./configs/jupyter_notebook_config.json /usr/local/etc/jupyter/jupyter_notebook_config.json
COPY ./configs/overrides.json /usr/local/share/jupyter/lab/settings/overrides.json

# Install extensions
RUN jupyter labextension install @karosc/jupyterlab_dracula --no-build && \
    jupyter labextension install @krassowski/jupyterlab-lsp --no-build && \
    jupyter labextension install @ijmbarr/jupyterlab_spellchecker --no-build && \
    jupyter labextension install @jupyterlab/toc --no-build && \
    jupyter labextension install @aquirdturtle/collapsible_headings --no-build && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter lab clean && \
    jupyter lab build --minimize=False --dev-build=False --debug && \
    jupyter serverextension enable --py jupyterlab_code_formatter

# Copy entrypoint
COPY scripts/entrypoint.sh $HOME
# run entrypoint
# ENTRYPOINT ["/home/entrypoint.sh"]