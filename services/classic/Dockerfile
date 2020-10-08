# pull official base image
FROM python:3.8.2-slim-buster
# create the appropriate directories
ENV HOME=/home
ENV APP_HOME=/home/classic
RUN mkdir $APP_HOME
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
    curl git vim zsh tree
# Install Oh my Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
RUN chsh -s $(which zsh)
# Set workdir
WORKDIR $APP_HOME
# Install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt
COPY ./configs/jupyter_notebook_config.py /home/.jupyter/jupyter_notebook_config.py
# Install extensions
# RISE slideshow extension
RUN jupyter-nbextension enable rise --py --sys-prefix
# Jupyter contrib extensions
RUN jupyter contrib nbextension install
RUN jupyter nbextension enable spellchecker/main
RUN jupyter nbextension enable autosavetime/main
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable hinterland/hinterland
RUN jupyter nbextension enable code_prettify/code_prettify
RUN jupyter nbextension enable table_beautifier/main
# Set spellchecker lang
COPY scripts/set_spellchecker_lang.py $HOME
RUN python3 /home/set_spellchecker_lang.py
# Enable dark theme
RUN jt -t monokai -f fira -fs 13 -nf ptsans -nfs 11 -N -kl -cursw 5 -cursc r -T


