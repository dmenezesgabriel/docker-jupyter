# Jupyter Analytics

Dockerized Jupyterlab, a daily grinder.

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
