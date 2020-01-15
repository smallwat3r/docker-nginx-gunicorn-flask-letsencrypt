#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File  : serve.py
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 27.12.2019

"""Flask application views."""
from flask import render_template

from . import app


@app.route("/")
def root():
    """Main."""
    return render_template("index.html", msg="Awesome, it works!")
