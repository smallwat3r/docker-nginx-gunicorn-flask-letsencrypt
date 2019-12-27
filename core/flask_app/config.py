#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File  : config.py
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 04.12.2019
import os


class DefaultConfig:
    '''Default.'''

    DEBUG = True


class ProdConfig(DefaultConfig):
    '''Production.'''

    DEBUG = False
