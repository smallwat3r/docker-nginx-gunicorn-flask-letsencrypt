#! /bin/bash

# Author: Matthieu Petiteau - smallwat3r
# Start a flask development environment server

build()
{
    STATUS=$@
    echo $STATUS
    virtualenv -p python3 venv --no-site-package
    source venv/bin/activate
    pip install -r requirements.txt
}

cd core/

if [ -d venv/ ];
then
    echo "[+] Virtual environment already created."
    source venv/bin/activate && pip freeze > temp.txt
    if cmp -s "requirements.txt" "temp.txt";
    then
        echo "[+] Up to date! No new package to install."
    else
        rm -rf venv/
        build "[+] Updating virtual environment"
    fi
    rm temp.txt
else
    build "[+] Building virtual environment"
fi

export FLASK_APP=frontend_soda_app
export FLASK_ENV=development
python3 -m flask run --host='0.0.0.0'
