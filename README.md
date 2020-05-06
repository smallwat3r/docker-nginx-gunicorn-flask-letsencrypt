<h3 align="center">docker-nginx-gunicorn-flask-letsencrypt</h3>
<p align="center">Boilerplate code for setting up Nginx + Gunicorn + Flask + LetsEncrypt certificates using docker-compose.</p>

---

This repository contains necessary files to build a web-app running
with Nginx / Gunicorn / Flask / LetsEncrypt using Docker and 
docker-compose.  

**Note: Tested on Ubuntu 16.04 and 18.04**

## Docker

service | image
--- | ---
flask & gunicorn | `python:3.8.2-alpine3.11`
nginx | `nginx:1.17.7-alpine`

## Requirements

dependency | commands
--- | ---
docker | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/45f50f067f248aa3c89eec832277f072)
docker-compose | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/bb4f986dae4cb2fac8f26c8557517dbd)
make | `sudo apt install make`
a domain or sub-domain | DNS A record needs to points to your server static IP

## Setting things up

#### 1) Clone this repo on your server

I recommend doing this in `/opt`  

```sh
cd /opt
sudo git clone https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt.git
```

Install docker, docker-compose and make (explained 
[above](#requirements)).  

#### 2) Add user to `docker` group  

```sh
sudo usermod -aG docker $USER
```
Log out from the server and log back in for changes to apply.  

#### 3) Define applications details
Copy `.env.example` to `.env` and enter your application details.  
```sh
# .env.example

# Email to get alerts from Letsencrypt.
EMAIL=email@email.com

# Domain name or subdomain linked to your server's public IP.
DOMAIN=mydomain.com

# Folder where is located your flask app in the repo. In this example
# it's under ./src/
APP_FOLDER=src

# Application environment.
FLASK_ENV=development

# If can be the app's entrypoint (wsgi if using ./src/wsgi.py)
# or the application package (as in this case) as the app's
# configs are under ./src/example_app/__init__.py
FLASK_APP=example_app
```

## Turning it on

**Start application**
```sh
sudo make dc-start
```
<p style="text-align: center;">
 🎉 Your web-app should now be running online with HTTPS 🎉   
</p>

**Other commands**
```sh
sudo make dc-stop        # Stop application.
sudo make dc-start-local # Start application w/o nginx (for running locally)
```

Auto checks are running weekly to update the certificates.  

## License

See [LICENSE](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/LICENSE) file.  

## Contact

Please report issues or questions 
[here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues).
