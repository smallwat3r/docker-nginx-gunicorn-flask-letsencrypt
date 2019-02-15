# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files and configs to build Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.     

**Note: Tested and working on Ubuntu 16.04 and 18.04**

### Base Docker Images 📎
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

### Requirements ⚠️  
---

* docker and docker-compose   
* make  


### Set-up & Installation ⚙️
---

#### 1) Define applications details
In `.env` file, enter your application details for the bellow variables.   
```
SSL_EMAIL=myemail@myemail.com
NGX_DOMAIN=mysuperwebsite.com
FLASK_SESSION_KEY=super_secret_key
```
*_SSL_EMAIL: Email address for Letsencrypt SSL certificate_   
*_NGX_DOMAIN: Domain name for Nginx config and Letsencrypt SSL certificate_   
*_FLASK_SESSION_KEY: Secret Key for Flask Session. It can be whatever you want. ie. 6d8dg8f4-49f493bf9-h30f489h9n_

#### 2) SSL Cert

We then need to install the Letsencrypt client to get SSL certicates.
```sh
$ make install-le-client
```
You will need to enter sudo password as the command needs to run with privileges.  
It installs the Letsencrypt client and get a certificate for specified domain and email address.   
Wait and follow the different instructions.

_Note: Free Letsencrypt cert are only available for 90 days. To renew the cert run_
```sh
$ make renew-le-cert
```

### Firing up ✅ 
---
**Start application**
```sh
$ sudo make dc-start
```
_Your web app should be now accessible at your domain with SSL certificates 🎉_

**Stop application**
```sh
$ sudo make dc-stop
``` 
