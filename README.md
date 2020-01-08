# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files and configs to build a web-app with Nginx / Gunicorn / Flask / Letsencrypt using Docker and docker-compose.   

**Note: Tested on Ubuntu 16.04 and 18.04**

## Docker

service | image | version
--- | --- | ---
app (core) | alpine | 3.8
nginx | nginx | latest

## Requirements

dependency | commands
--- | ---
docker | [cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/45f50f067f248aa3c89eec832277f072)
docker-compose | [cmds for ubuntu 16.04 or 18.04](https://gist.github.com/smallwat3r/bb4f986dae4cb2fac8f26c8557517dbd)
make | `sudo apt install make`
a web domain linked to your server | -

## Setting things up

#### 1) Add user to `docker` group  
```sh
sudo usermod -aG docker $USER
```
Log out and log back in for changes to apply.  

#### 2) Define applications details
In the `.env` file, enter your application details.   
```sh
# .env
SSL_EMAIL=myemail@myemail.com  # email address for Letsencrypt certificate
NGX_DOMAIN=mysuperwebsite.com  # web domain for Nginx config and Letsencrypt
FLASK_ENV=development          # python application environment development / production
```

#### 3) SSL certificates
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
