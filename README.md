# docker-nginx-gunicorn-flask with Letsencrypt   

This repository contains files necessary for building Nginx + Gunicorn + Flask with Letsencrypt using Docker and docker-compose.     

📎 Base Docker Images   
flask / gunicorn == alpine:3.7  
nginx == nginx:latest  

### ⚠️ Requirements for testing (flask only)
---
python 3.6+   
virtualenv `pip3 install virtualenv`  


#### Testing the flask app   
Make sure dev.sh is executable by running   
```sh
chmod +x dev.sh

```

Run the script  
```sh
./dev.sh
```

This will create a vitualenv under `/core` with requited packages.   
You should be able to access the app at 0.0.0.0:5000  
Means everything's fine and you can continue the installation.   


### ⚙️ Letsencrypt Installation
---
Download the Letsencrypt client  
```sh
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

Obtain the certificate
```sh
sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --email <<youremail@email.com>> -d <<yourdomain.com>>
```

Replace `<<youremail@email.com>>` and `<<yourdomain.com>>` by your actual email and domain name in `nginx/sites-enabled/nginx.conf`   

Letsencrypt certificates expires after 90 days.  
If you need to renew these run the below command (note that you can automatically renew it using a cron job)
```sh
sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email <<youremail@email.com>> -d <<yourdomain.com>>
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
