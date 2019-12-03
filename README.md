# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files and configs to build Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.   

**Note: Tested on Ubuntu 16.04 and 18.04**

### 📎 Base Docker Images
---

```
+---------------------------------------+
| service            | image  | version |
+====================|========|=========+
| Flask and Gunicorn | alpine | 3.7     |
+--------------------|--------|---------+
| Nginx              | nginx  | latest  |
+---------------------------------------+
```

### ⚠️ Requirements
---

* **docker** - _[install cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/45f50f067f248aa3c89eec832277f072)_
* **docker-compose** - _[install cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/bb4f986dae4cb2fac8f26c8557517dbd)_
* **make** - `sudo apt install make`
* **a domain name linked to your server**

Add user to the `docker` group on server  
```sh
sudo usermod -aG docker $USER
```
Log out and log back in for changes to apply.  

### ⚙️ Set-up & Installation
---

#### 1) Define applications details
In the `.env` file, enter your application details for the below variables.   
```
SSL_EMAIL=myemail@myemail.com
NGX_DOMAIN=mysuperwebsite.com
FLASK_SESSION_KEY=super_secret_key
FLASK_ENV=development
```
*_SSL_EMAIL: Email address for Letsencrypt SSL certificate_   
*_NGX_DOMAIN: Domain name for Nginx config and Letsencrypt SSL certificate_   
*_FLASK_SESSION_KEY: Secret Key for Flask Session. It can be whatever you want. ie. 6d8dg8f4-49f493bf9-h30f489h9n_   
*_FLASK_ENV: Python application environment development / production._   

#### 2) SSL Certificates

We need to install the Letsencrypt client to get the SSL certicates.
```sh
$ make install-le-client
```
You might need to enter your sudo password as the command needs to run with admin privileges.   
It installs the Letsencrypt client and get a certificate for the specified domain name and email address.   
Wait for the installation and follow the different instructions.   

_Note: Free Letsencrypt cert are only available for 90 days. To renew the cert run_   
```sh
$ make renew-le-cert
```

### ✅ Firing up
---
**Start application**
```sh
$ sudo make dc-start
```
_ 🎉 Your web app should be now accessible at your domain with SSL certificates behind Nginx 🎉_   
![Alt text](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/screenshot.png)


**Stop application**
```sh
$ sudo make dc-stop
```
