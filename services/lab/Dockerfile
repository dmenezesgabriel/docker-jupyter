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

# Install system dependencies
RUN apt-get update && apt-get install -y \
    fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
    libnspr4 libnss3 lsb-release xdg-utils libxss1 libdbus-glib-1-2 \
    curl unzip wget \
    xvfb \
    ffmpeg

# install geckodriver and firefox
RUN GECKODRIVER_VERSION=`curl https://github.com/mozilla/geckodriver/releases/latest | grep -Po 'v[0-9]+.[0-9]+.[0-9]+'` && \
    wget https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
    tar -zxf geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz

RUN FIREFOX_SETUP=firefox-setup.tar.bz2 && \
    apt-get purge firefox && \
    wget -O $FIREFOX_SETUP "https://download.mozilla.org/?product=firefox-latest&os=linux64" && \
    tar xjf $FIREFOX_SETUP -C /opt/ && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    rm $FIREFOX_SETUP

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
    jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build && \
    jupyter labextension install spreadsheet-editor --no-build && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
    jupyter labextension install qgrid2 --no-build && \
    jupyter lab clean && \
    jupyter lab build --minimize=False --dev-build=False --debug && \
    jupyter serverextension enable --py jupyterlab_code_formatter

# Copy entrypoint
COPY scripts/entrypoint.sh $HOME
# run entrypoint
# ENTRYPOINT ["/home/entrypoint.sh"]