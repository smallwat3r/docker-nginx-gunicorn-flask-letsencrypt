# docker-nginx-gunicorn-flask-letsencrypt

This repository contains necessary files and configs to build Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.     

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

**Make sure to replace `YOUREMAIL@EMAIL.COM` and `YOURDOMAINNAME.COM` by your actual email and domain name.**    
**Same thing for the values in the nginx config file at `nginx/sites-enabled/nginx.conf`**   


### Letsencrypt set-up ⚙️
---
Download the Letsencrypt client
```sh
$ sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

Obtain the certificate
```sh
$ sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --email YOUREMAIL@EMAIL.COM -d YOURDOMAINNAME.COM
```  

_Letsencrypt certificates expires after 90 days._  
_If you need to renew these run the below command (note that you can automatically renew it using a cron job)_
```sh
$ sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email YOUREMAIL@EMAIL.COM -d YOURDOMAINNAME.COM
```

### Firing up ✅ 
---
**Start**
```sh
$ make dc-start
```
_Your web app should be now accessible at your domain with SSL certificates 🎉_

**Stop**
```sh
$ make dc-stop
``` 
