# -*- coding: utf-8 -*-

"""
 @author    Matthieu Petiteau - smallwat3r
 @contact   mpetiteau.pro@gmail.com

 Main - Run application.
"""

from flask import render_template, send_from_directory, request
from . import app


@app.route("/")
def root():
    return render_template('hello.html')


@app.route("/robots.txt")
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])


@app.errorhandler(404)
def error_404(error):
    return render_template('404.html', error=error)


@app.context_processor
def inject_global():
    return {
        'user': 'Smallwat3r'
    }
