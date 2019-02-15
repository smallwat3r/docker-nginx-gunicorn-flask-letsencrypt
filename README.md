# docker-nginx-gunicorn-flask with Letsencrypt   

This repository contains files necessary for building Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.     

📎 Base Docker Images   

| service            | image  | version |
+====================|========|=========+
| Flask and Gunicorn | alpine | 3.7     |
+--------------------|--------|---------+
| Nginx              | nginx  | latest  |
+--------------------|--------|---------+

### ⚠️  Requirements
---

* docker and docker-compose   
* make  

### ⚙️  Letsencrypt Installation
---
Download the Letsencrypt client  
```sh
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

Obtain the certificate
```sh
sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --email YOUREMAIL@EMAIL.COM -d YOURDOMAINNAME.COM
```

Replace `YOURDOMAINNAME.COM` by your actual email and domain name in `nginx/sites-enabled/nginx.conf`   

Letsencrypt certificates expires after 90 days.  
If you need to renew these run the below command (note that you can automatically renew it using a cron job)
```sh
sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email YOUREMAIL@EMAIL.COM -d YOURDOMAINNAME.COM
```

### ✅ Firing up   
---
Start docker-compose
```sh
make dc-start
```
Your web app should be now accessible at your domain using SSL certificates 🎉

Stop docker
```sh
stop dc-stop
``` 
