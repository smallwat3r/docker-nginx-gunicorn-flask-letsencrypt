#! /bin/bash

# Author: Matthieu Petiteau - smallwat3r
# Start a flask development environment server

cd core/

if [ -d venv/ ]; then
    echo "Virtual environment already created."
    source venv/bin/activate
else
    echo "Building virtual environment"
    virtualenv -p python3 venv --no-site-package
    source venv/bin/activate
    pip install -r requirements.txt
fi

export FLASK_APP=flask_app
export FLASK_ENV=development
python3 -m flask run --host='0.0.0.0'
