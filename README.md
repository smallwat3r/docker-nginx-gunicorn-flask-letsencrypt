# Docker-nginx-gunicorn-flask-letsencrypt

This repository is a boilerplate to run a web server with Nginx <-> Gunicorn <-> Flask with LetsEncrypt (Certbot) using Docker.

## Docker

service | image
--- | ---
app | `python:3.13-slim`
nginx | `nginx:alpine-slim`

## Requirements

dependency | commands
--- | ---
docker | [Documentation](https://docs.docker.com/engine/install/debian/#install-using-the-repository)
make | `sudo apt install make`

Other:
- a domain or sub-domain with a DNS A record pointing to your server's static IP
- open ports on server: 80 (http) and 443 (https)

## Setting things up

#### 1) Get the code on your server

    curl -L https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/archive/refs/heads/master.tar.gz | tar -xz
    cd docker-nginx-gunicorn-flask-letsencrypt-master

#### 2) Add current user to `docker` group  

    sudo usermod -aG docker "${USER}"

Log out from the server and log back in for changes to apply.  

#### 3) Define your configurations

Set up your configuration in the `.env` file:
- `EMAIL`: email to get alerts from LetsEncrypt
- `DOMAIN`: the domain (or subdomain) to use

It is also recommended to update or add any missing values required for your setup in `flask.env` and in `src/gunicorn.conf.py`

## Side note

This repo is just a boilerplate designed to build from. You will likely use your own app and not the provided one by this boilerplate, so you will probably need to update `src/Dockerfile` and install any required dependencies or change a few things. The same is true for `nginx/conf.d/app.conf`, it is possible you will need to change the CSP to be more lax.
 
## Turning it on

Note that depending on your setup, you might need to run those commands with sudo.

**Start application**

    make start

Your app should now be running online with HTTPS!  

**All commands**

    % make help
    Usage: make [TARGET ...]

    help         Show this help menu
    stop         Stop docker (might need sudo)
    start        Start docker (might need sudo)
    start-local  Start docker for local dev (w/o nginx)

Auto checks are running weekly to update the certificates.  

## License

See [LICENSE](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/LICENSE) file.  

## Contact

Please report issues or questions 
[here](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues).


[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]


[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/smallwat3r
