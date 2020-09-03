# Gunicorn configuration file.
# This file can be used from the Gunicorn cli with the ``-c`` paramater.
# Eg. ``gunicorn -c <config_file>``
import multiprocessing

bind = "0.0.0.0:5000"
workers = multiprocessing.cpu_count() * 2 + 1
