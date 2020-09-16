# Jupyter Analytics

## Features

- Dracula theme
- Markdown spellcheck extension
- Table fo contents extension
- Collapsible headers extension

## Requirements

- Docker
- Docker Compose

## Usage

1. Create a `.env` based on `.env.template` replacing the desired variables
2. Build the image:
   ```sh
   make build
   ```
3. Run the container:
   ```sh
   make run
   ```

## TODO

- Recursively install requirements for each nbs folder
