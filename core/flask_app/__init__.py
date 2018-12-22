# -*- coding: utf-8 -*-

"""
 @author    Matthieu Petiteau - smallwat3r
 @contact   mpetiteau.pro@gmail.com

 Init Flask application. Must be run as a module.
"""

__author__ = "Matthieu Petiteau"
__maintainer__ = "Matthieu Petiteau"
__email__ = "mpetiteau.pro@gmail.com"

from flask import Flask
from werkzeug.contrib.fixers import ProxyFix
from . import config

app = Flask(__name__, template_folder=config.TEMPLATES, static_folder="static")
app.wsgi_app = ProxyFix(app.wsgi_app)
app.secret_key = config.SESSION_KEY

import flask_app.serve
