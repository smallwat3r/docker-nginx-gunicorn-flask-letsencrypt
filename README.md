# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files and configs to build Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.   

**Note: Tested on Ubuntu 16.04 and 18.04**

## 🐳 Base Docker Images

```
+---------------------------------------+
| service            | image  | version |
+====================|========|=========+
| Flask and Gunicorn | alpine | 3.8     |
+--------------------|--------|---------+
| Nginx              | nginx  | latest  |
+---------------------------------------+
```

## ⚠️ Requirements

* **docker** - _[cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/45f50f067f248aa3c89eec832277f072)_
* **docker-compose** - _[cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/bb4f986dae4cb2fac8f26c8557517dbd)_
* **make** - `sudo apt install make`
* **a domain name linked to your server**

Add user to the `docker` group on server  
```sh
sudo usermod -aG docker $USER
```
Log out and log back in for changes to apply.  

## ⚙️ Set-up & Installation

#### 1) Define applications details
In the `.env` file, enter your application details for the below variables.   
```
SSL_EMAIL=myemail@myemail.com
NGX_DOMAIN=mysuperwebsite.com
FLASK_ENV=development
```
*_SSL_EMAIL: Email address for Letsencrypt SSL certificate_   
*_NGX_DOMAIN: Domain name for Nginx config and Letsencrypt SSL certificate_   
*_FLASK_ENV: Python application environment development / production._   

#### 2) SSL Certificates

We need to install the Letsencrypt client to get the SSL certicates.
```sh
sudo make install-le-client
```
It installs the Letsencrypt client and get a certificate 
for the specified domain name and email address.   
Wait for the installation and follow the different 
instructions.   

_Note: Free Letsencrypt cert are only available for 90 days. To renew the cert run_   
```sh
sudo make renew-le-cert
```

## ✅ Firing up

**Start application**
```sh
sudo make dc-start
```
 🎉 Your web-app should now be accessible with HTTPS 🎉   
![screenshot https](https://github.com/smallwat3r/docker-nginx-gunicorn-flask-letsencrypt/blob/master/_screenshot/screenshot.png)


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
