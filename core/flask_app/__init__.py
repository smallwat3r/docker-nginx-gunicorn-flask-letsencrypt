#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : __init__.py
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Thu  7 Feb 16:23:49 2019
# Last Modified Date: Thu  7 Feb 16:23:49 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

__author__ = "Matthieu Petiteau"
__maintainer__ = "Matthieu Petiteau"
__email__ = "mpetiteau.pro@gmail.com"

import os
from flask import Flask
from werkzeug.contrib.fixers import ProxyFix

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)

configurations = {
    'development': 'flask_app.config.DefaultConfig'
}
app.config.from_object(configurations[os.getenv('FLASK_ENV')])

import flask_app.serve
