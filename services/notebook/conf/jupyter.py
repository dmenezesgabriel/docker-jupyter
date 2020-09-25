import os

c = get_config()
# Kernel config
c.IPKernelApp.pylab = "inline"  # plotting support always in your notebook
# Notebook config
c.NotebookApp.notebook_dir = "nbs"
c.NotebookApp.allow_origin = ""  # put your public IP Address here
c.NotebookApp.ip = "*"
c.NotebookApp.allow_remote_access = True
c.NotebookApp.open_browser = False
# ipython -c "from notebook.auth import passwd; passwd()"
c.NotebookApp.password = ""
c.NotebookApp.port = int(os.environ.get("PORT", 8888))
c.NotebookApp.allow_root = True
c.NotebookApp.allow_password_change = True
c.ConfigurableHTTPProxy.command = [
    "configurable-http-proxy",
    "--redirect-port",
    "80",
]
