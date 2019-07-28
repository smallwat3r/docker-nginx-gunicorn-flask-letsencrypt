#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : gunicorn_ini.py
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Fri 15 Feb 12:02:16 2019
# Last Modified Date: Fri 15 Feb 12:02:16 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

"""Init gunicorn config."""
import multiprocessing

bind = '0.0.0.0:5000'
workers = multiprocessing.cpu_count() * 2 + 1
