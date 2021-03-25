<h3 align="center">docker-nginx-gunicorn-flask-letsencrypt</h3>
<p align="center">Boilerplate code for setting up Nginx + Gunicorn + Flask + LetsEncrypt certificates using docker-compose.</p>

---

This repository contains necessary files to build a web-app running
with Nginx / Gunicorn / Flask / LetsEncrypt (Certbot) using Docker 
and docker-compose.  

**Note: Tested on Ubuntu 16.04, 18.04, 20.04**

## Docker

service | image
--- | ---
flask & gunicorn | `python:3.8-alpine`
nginx | `nginx:1.19-alpine`

## Requirements

dependency | commands
--- | ---
docker | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/a1664013e6ca8fb9ee02dd4b886a4996)
docker-compose | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/05f4b4a7a8361901d23bfdd492e40870)
make | `sudo apt install make`
a domain or sub-domain | DNS A record needs to points to your server static IP
open ports | 80 (http) and 443 (https)

## Setting things up

#### 1) Clone this repo on your server

```sh
sudo git clone https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt.git
```

Install docker, docker-compose and make (commands can be found
[above](#requirements)).  

#### 2) Add user to `docker` group  

```sh
sudo usermod -aG docker $USER
```
Log out from the server and log back in for changes to apply.  

#### 3) Define your application details

Copy `.env.example` to `.env` and set up the environment variables.
```sh
# .env

# Email to get alerts from LetsEncrypt.
EMAIL=email@email.com

# Domain name or subdomain linked to your server's public IP.
DOMAIN=mydomain.com

# Folder where your flask app is located in the repo. In this example
# it's under ./src/
APP_FOLDER=src

# Application environment name
FLASK_ENV=development

# It can be the application entrypoint (wsgi if using ./src/wsgi.py)
# or the application package (as in this case) as the app's
# configs are under ./src/example_app/__init__.py
FLASK_APP=example_app
```

## Good to know

If you're running your own application and not the example one from 
this repository you probably need to update or replace the `src/Dockerfile` to 
your needs (in terms of dependencies etc). It's also known that some Python 
projects can have a hard time running from Python's Alpine images, so you might 
want/need to switch to a more standard `python:3.8` image.  

## Turning it on

**Start application**
```sh
sudo make dc-start
```
<p style="text-align: center;">
 🎉 Your web-app should now be running online with HTTPS 🎉   
</p>

**All commands**

```console
% make help
Usage: make [TARGET ...]

help            Show this help menu
dc-stop         Stop docker (might need sudo)
dc-start        Start docker (might need sudo)
dc-start-local  Start docker for local dev (w/o nginx)
```

Auto checks are running weekly to update the certificates.  

## License

See [LICENSE](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/LICENSE) file.  

## Contact

Please report issues or questions 
[here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues).


[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]


[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/smallwat3r
