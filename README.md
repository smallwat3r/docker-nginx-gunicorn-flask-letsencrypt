# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files to build a web-app running with Nginx / Gunicorn / Flask / LetsEncrypt using Docker and docker-compose.  

**Note: Tested on Ubuntu 16.04 and 18.04**

## Docker

service | image
--- | ---
flask & gunicorn | `alpine:3.11.0`
nginx | `nginx:1.17.7-alpine`

## Requirements

dependency | commands
--- | ---
docker | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/45f50f067f248aa3c89eec832277f072)
docker-compose | [commands for Debian / Ubuntu](https://gist.github.com/smallwat3r/bb4f986dae4cb2fac8f26c8557517dbd)
make | `sudo apt install make`
a domain or sub-domain | DNS A record needs to points to your server static IP

### Notes if you want to run it with you own Flask app

#### Flask notes  
In this example the Flask app is built to run as a module, that's why there is no `app.py` nor `wsgi.py` file. The app configs are set-up inside `__init__.py` directly.  

Replace all the files inside `./core/flask_app/` (including `__init__.py`) with yours.  

If you haven't your app set-up to run as a module as explained above, you will need to create a `wsgi.py` file in `./core/`.  

Example:  
```py
# ./core/wsgi.py

# Import your flask entrypoint from `./core/flask_app/`, this is where you're setting up
# your app variable: app = Flask(__name__) and configs for app.
# The convention is to call this file app.py but it could be something else.
# For ex if your entrypoing is server.py this would be: from flask_app.server import app
from flask_app.app import app

if __name__ == "__main__":
    app.run()
```

Then you will need to change the gunicorn command [here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/6c7b933f396b7645c86820f71138baa0b1c4e589/docker-compose.yml#L33) in the docker-compose file, and point it to the new entrypoint for gunicorn `wsgi.py`.  

This would be: `gunicorn -c gunicorn_ini.py wsgi:app`  

You might also want to update the `./core/requirements.txt` file with your Python packages.  
Also if you tweak `./core/gunicorn_ini.py`, for this config to work, gunicorn needs to bind to port `5000`.  

#### Dockerfile (./core) notes  
Some specific Python packages might require specific dependencies on the Alpine image to install. Also as the image is set-up to run with a non-root user, if your app needs access to specific directories, you might need to edit the Dockerfile to allow access to the user `app`.  


## Setting things up

#### 1) Clone this repo on your server

I recommend doing this in `/opt`  

```sh
cd /opt
sudo git clone https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt.git
```

Install docker, docker-compose and make (explained [above](#requirements)).  

If you want to run your own Flask app, replace the files in `./core/flask_app/` by your own (explained [above](#notes-if-you-want-to-run-it-with-you-own-flask-app)).  

#### 2) Add user to `docker` group  

```sh
sudo usermod -aG docker $USER
```
Log out from the server and log back in for changes to apply.  

#### 3) Define applications details
Copy `.env.example` to `.env` and enter your application details.   
```sh
# .env.example

# email to get automatic alerts from Letsencrypt
EMAIL=myemail@myemail.com

# domain name or subdomain for Nginx config and Letsencrypt
DOMAIN=mysuperwebsite.com

# flask application environment
FLASK_ENV=development

# Use different volumes for letsencrypt when running locally or remotely
NGINX_VOLUMES=/etc/letsencrypt:/etc/letsencrypt
# For running locally on macos
#NGINX_VOLUMES=/private/etc/letsencrypt:/etc/letsencrypt
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
sudo make dc-reboot   # Reboot application.
sudo make dc-stop     # Stop application.
sudo make dc-cleanup  # Delete and clear docker images.
```

Auto checks are running weekly to update the certificates.  

## License

See [LICENSE](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/LICENSE) file.  

## Contact

Please report issues or questions [here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues).
