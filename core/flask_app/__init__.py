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
import os
import yaml

ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.join(ROOT_PATH, 'global_templates')
secret = yaml.load(stream=open(file="{p}/credentials.yml".format(p=ROOT_PATH)))

app = Flask(__name__, template_folder=TEMPLATES, static_folder="static")
app.wsgi_app = ProxyFix(app.wsgi_app)
app.secret_key = secret['session_key']

import flask_app.serve
