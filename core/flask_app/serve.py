#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : serve.py
# Author            : Matthieu Petiteau - smallwat3r <mpetiteau.pro@gmail.com>
# Date              : Tue 22 Jan 11:15:37 2019
# Last Modified Date: Tue 22 Jan 11:15:37 2019
# Last Modified By  : Matthieu Petiteau - smallwat3r <mpetiteau.pro@gmail.com>

"""Views."""
from flask import render_template, request, send_from_directory

from . import app


@app.route("/")
def root():
    """Main."""
    return render_template('hello.html')


@app.route("/robots.txt")
def static_from_root():
    """Serve robots.txt file."""
    return send_from_directory(app.static_folder, request.path[1:])


@app.errorhandler(404)
def error_404(error):
    """404 error handling."""
    return render_template('404.html', error=error)


@app.context_processor
def inject_global():
    """Context global jinja values."""
    return {
        'user': 'Pythonista'
    }
