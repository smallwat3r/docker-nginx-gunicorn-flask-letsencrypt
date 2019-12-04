#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File  : __init__.py
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 04.12.2019

"""Init app."""
import os

from flask import Flask
from werkzeug.contrib.fixers import ProxyFix

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)

# Load config from class.
configurations = {
    'development': 'flask_app.config.DefaultConfig',
    'production': 'flask_app.config.ProductionConfig'
}
app.config.from_object(configurations[os.getenv('FLASK_ENV')])

import flask_app.serve
