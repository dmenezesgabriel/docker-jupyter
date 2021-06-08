import os

c = get_config()
# Kernel config
c.IPKernelApp.pylab = "inline"  # plotting support always in your notebook
# Notebook config
c.NotebookApp.notebook_dir = "nbs"
c.NotebookApp.allow_origin = "*"  # put your public IP Address here
c.NotebookApp.ip = "*"
c.NotebookApp.allow_remote_access = True
c.NotebookApp.open_browser = False
c.NotebookApp.base_url = "/"
# Generate a password
# ipython -c "from notebook.auth import passwd; passwd()"
c.NotebookApp.password = os.environ.get(
    "LAB_PASSWORD",
    "argon2:$argon2id$v=19$m=10240,t=10,p=8$h8fNDluQ2st1XLK7tRxmhw$70reVlCnE4Az1CCIOu30mQ",
)
c.NotebookApp.port = int(os.environ.get("PORT", 8888))
c.NotebookApp.allow_root = True
c.NotebookApp.allow_password_change = True
c.ConfigurableHTTPProxy.command = [
    "configurable-http-proxy",
    "--redirect-port",
    "80",
]
c.NotebookApp.terminado_settings = {"shell_command": ["/usr/bin/zsh"]}
# Disable Jedi in IPython, to improve the performance of autocompletion.
c.Completer.use_jedi = False
