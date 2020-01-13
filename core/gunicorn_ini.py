#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File  : gunicorn_ini.py
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 27.12.2019

"""Gunicorn config."""
import multiprocessing

bind = "0.0.0.0:5000"
workers = multiprocessing.cpu_count() * 2 + 1
