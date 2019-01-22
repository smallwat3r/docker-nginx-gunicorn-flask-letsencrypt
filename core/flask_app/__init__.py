#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : __init__.py
# Author            : Matthieu Petiteau - smallwat3r <mpetiteau.pro@gmail.com>
# Date              : Tue 22 Jan 11:16:09 2019
# Last Modified Date: Tue 22 Jan 11:16:09 2019
# Last Modified By  : Matthieu Petiteau - smallwat3r <mpetiteau.pro@gmail.com>

"""
 Init Flask application. Must be run as a module.
"""

__author__ = "Matthieu Petiteau"
__maintainer__ = "Matthieu Petiteau"
__email__ = "mpetiteau.pro@gmail.com"

from flask import Flask
from werkzeug.contrib.fixers import ProxyFix
import os
import yaml

__ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
_SECRET = yaml.load(open("{p}/credentials.yml".format(p=__ROOT_PATH)))

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)
app.secret_key = _SECRET['session_key']

import flask_app.serve
