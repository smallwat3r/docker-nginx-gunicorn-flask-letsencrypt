# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files to build a web-app running with Nginx / Gunicorn / Flask / Letsencrypt using Docker and docker-compose.   

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

## Setting things up

#### 1) Clone this repo on your server

I recommend doing this in `/opt`  

```sh
cd /opt
sudo git clone https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt.git
```

Install docker, docker-compose and make (explained just above).  

<details>
<summary>If you want to add your own flask app</summary>

You can wipe out the files under `core/flask_app/` to add your own.  

You might also want to edit the `core/requirements.txt` file with your Python dependencies.  

**Flask notes**  
In this example the Flask app is built to run as a module, that's why there is no `app.py` or `wsgi.py` file. The app configs are set-up inside `__init__.py`. If you haven't set-up your app to run as a module you might need to change the gunicorn command [here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/6c7b933f396b7645c86820f71138baa0b1c4e589/docker-compose.yml#L33) in the docker-compose file, and point it to the correct entrypoint.  

**Dockerfile notes**  
Some specific Python dependencies might require specific dependencies on the Alpine image to install. Also as the image is set-up to run with a non-root user, if you're app needs access to specific directories, you might need to edit the Dockerfile.  

</details>

#### 2) Add user to `docker` group  

```sh
sudo usermod -aG docker $USER
```
Log out from the server and log back in for changes to apply.  

#### 3) Define applications details
In the `.env` file, enter your application details.   
```sh
# .env

# email to get automatic alerts from Letsencrypt
EMAIL=myemail@myemail.com

# domain name or subdomain for Nginx config and Letsencrypt
DOMAIN=mysuperwebsite.com

# flask application environment
FLASK_ENV=development
```

#### 4) SSL certificates
We need to install the Letsencrypt client to get the SSL certicates.
```sh
sudo make install-le-client
```
It installs the Letsencrypt client and get a certificate for the specified web domain.  

_Note: Free Letsencrypt cert are only available for 90 days. To renew the cert run_   
```sh
sudo make renew-le-cert
```

## Turning on

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

## License

See [LICENSE](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/LICENSE) file.  

## Contact

Please report issues or questions [here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues).
