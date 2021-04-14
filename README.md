# Jupyter Analytics

## Jypyter lab

### Integrations

- [Oh my ZSH](https://ohmyz.sh/)
- [Vim text editor](https://www.vim.org/)
- [Dracula theme](https://draculatheme.com/)
- [Spellchecker](https://github.com/jupyterlab-contrib/spellchecker)
- [Code completion](https://github.com/krassowski/jupyterlab-lsp)
- [Code formatter](https://github.com/ryantam626/jupyterlab_code_formatter)
- [Table fo contents](https://github.com/jupyterlab/jupyterlab-toc)
- [Collapsible headers](https://github.com/aquirdTurtle/Collapsible_Headings)
- [.csv template](https://github.com/krassowski/jupyterlab-spreadsheet-editor)
- [Qgrid](https://github.com/quantopian/qgrid)
- [Jupytext](https://github.com/mwouts/jupytext)

### Requirements

- Docker
- Docker Compose
- Makefile

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
