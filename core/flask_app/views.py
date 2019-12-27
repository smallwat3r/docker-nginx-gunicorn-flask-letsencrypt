#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File  : serve.py
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 27.12.2019

'''Views.'''
from flask import render_template, request, send_from_directory

from . import app


@app.route('/')
def root():
    '''Main.'''
    msg = ('Congrats, you\'re running Flask, Gunicorn, Nging and LetsEncrypt'
           ' using Docker containers')
    return render_template('index.html', msg=msg)


@app.route('/robots.txt')
def static_from_root():
    '''Serve robots.txt file.'''
    return send_from_directory(app.static_folder, request.path[1:])


@app.errorhandler(404)
def error_404(error):
    '''404 error handling.'''
    return render_template('404.html', error=error)
