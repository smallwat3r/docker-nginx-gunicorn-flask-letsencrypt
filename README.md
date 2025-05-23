# Docker + Nginx + Gunicorn + Flask + Let's Encrypt

This repository is a Docker-based boilerplate for deploying a Flask web application in production. It uses:

- **Nginx** as a reverse proxy  
- **Gunicorn** as the WSGI server  
- **Flask** for the web application  
- **Let's Encrypt (Certbot)** for free HTTPS  
- **Docker** for easy deployment and reproducibility

## Docker Services

| Service | Image              |
|---------|--------------------|
| app     | `python:3.13-slim` |
| nginx   | `nginx:alpine-slim` |

---

## Requirements

| Dependency | Installation |
|------------|--------------|
| Docker     | [Install Docker](https://docs.docker.com/engine/install/debian/#install-using-the-repository) |
| Make       | `sudo apt install make` |

Other prerequisites:

- A domain or subdomain with a DNS A record pointing to your server's static IP  
- Open ports **80** (HTTP) and **443** (HTTPS)

##  Setup Instructions

### 1. Clone the repository on your server

```bash
curl -L https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/archive/refs/heads/master.tar.gz | tar -xz
cd docker-nginx-gunicorn-flask-letsencrypt-master
```

### 2. Add your user to the Docker group

```bash
sudo usermod -aG docker "${USER}"
```

> **Note:** Log out and back in for this change to take effect.

### 3. Configure environment variables

Edit the `certbot.env` file:

- `EMAIL`: Email for Certbot (receive alerts)
- `DOMAIN`: Your domain or subdomain

Also you should check and update (if necessary):

- `flask.env` for your Flask app environment variables
- `src/gunicorn.conf.py` for Gunicorn settings

## Notes

This is a **starter boilerplate**, meant to be customized. You’ll likely want to:

- Replace the example app in `src/`
- Update `src/Dockerfile` for your dependencies, or slightly change the Gunicorn command required to start your app
- Edit `nginx/conf.d/app.conf` for your specific reverse proxy needs (e.g., CSP headers)

## Running the Application

> You may need `sudo` to run Docker commands depending on your setup.

### Start the app

```bash
make start
```

Your app should now be running online with HTTPS!

> SSL certificates are automatically renewed weekly.

### All available commands

```bash
$ make help

help         Show this help menu  
stop         Stop Docker containers  
start        Start in production mode  
start-local  Start in local dev mode (without Nginx)
```

## License

Licensed under the [MIT License](LICENSE).

## Support

Have a question or issue?  
Open one on the [GitHub Issues page](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/issues)

---

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg  
[buymeacoffee]: https://www.buymeacoffee.com/smallwat3r
