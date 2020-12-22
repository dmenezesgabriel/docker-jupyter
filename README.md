# Jupyter Analytics

## Jypyter lab

### Features

- Oh my ZSH terminal
- Vim text editor
- Dracula theme
- Markdown cells spellcheck
- Code completion
- Code formatter
- Table fo contents
- Collapsible headers
- .csv template
- Qgrid view

### Requirements

- Docker
- Docker Compose

### Usage

1. Generate a password and place it on a `.env` variable called `LAB_PASSWORD`

```sh
make psswd
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
