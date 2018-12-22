# -*- coding: utf-8 -*-

"""
 @author    Matthieu Petiteau - smallwat3r
 @contact   mpetiteau.pro@gmail.com

 Config file. Load all config and secrets from credentials.yml
"""

import yaml
import os


# -- Paths --
ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.join(ROOT_PATH, 'global_templates')  # Jinja global temp.

secret = yaml.load(stream=open(file="{p}/credentials.yml".format(p=ROOT_PATH)))

# -- Flask session key --
SESSION_KEY = secret['session_key']
