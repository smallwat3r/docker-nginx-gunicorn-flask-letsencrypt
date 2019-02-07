# docker-nginx-gunicorn-flask with Letsencrypt   

This repository contains files necessary for building Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.     

📎 Base Docker Images   
flask / gunicorn == alpine:3.7  
nginx == nginx:latest  

### ⚠️ Requirements
---

* python 3.6+   
* virtualenv `pip3 install virtualenv`  
* docker and docker-compose   
* make  


#### Testing the flask app (flask only)   
Make sure dev.sh is executable by running   
```sh
chmod +x dev.sh
```

Run the script  
```sh
./dev.sh
```

This will create a vitualenv under `/core` with the required packages.   
You should now be able to access the app at `0.0.0.0:5000` .   


### ⚙️ Letsencrypt Installation
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
