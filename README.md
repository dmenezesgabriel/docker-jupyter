# Jupyter Analytics

## Jypyter lab

### Features

- Oh my ZSH terminal
- Vim text editor
- Dracula theme
- Markdown cells spellcheck (en_US)
- Code completion
- Code formatter
- Table fo contents
- Collapsible headers

### Requirements

- Docker
- Docker Compose

### Usage

1. Generate a password and replace it on `.env` file's variables `LAB_PASSWORD` or `CLASSIC PASSWORD`. Run the command below inside the respective container shell with `make lab-shell` or `make classic-shell`.

```sh
ipython -c "from notebook.auth import passwd; passwd()"
```

2. Build the image:
   ```sh
   make build
   ```
3. Run the container:
   ```sh
   make run
   ```

#### Virtual environments

1. **Create a virtual environment**:

```sh
python3 -m venv venv
```

2. **Activate virtual environment**:

```sh
source venv/bin/activate
```

3. **Install Ipykernel**:

```sh
pip install ipykernel
```

4. **Create an Ipkernel for the project**:

```sh
python -m ipykernel install  --display-name="Test ipknernel"
```

#### Shell

Use the command below on terminal

```sh
zsh
```

### TODO

- Portuguese spellchecker
