#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : config.py
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Thu  7 Feb 16:14:08 2019
# Last Modified Date: Thu  7 Feb 16:14:08 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

"""Flask environment config."""
import os


class DefaultConfig:
    """Default config values (Development)."""

    DEBUG = True
    SESSION_KEY = os.getenv('FLASK_SESSION_KEY')
