# File     : Dockerfile
# Date     : 13.01.2020
# Author   : Matthieu Petiteau <mpetiteau.pro@gmail.com>
#
# Dockerfile for Nginx.
#

FROM nginx:1.17.7-alpine

# Replace the nginx.conf file.
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

# Add our flask_app.conf file to our image.
RUN rm /etc/nginx/conf.d/default.conf
COPY ./conf.d/flask_app.conf /etc/nginx/conf.d/

# We use a small hack with envsubst to pass variables to our Nginx config file.
# The variables in Nginx needs to be in this specific format: ${FOO}. That's why
# we create also a DOLLAR variable to add the "real" $ in our config flask_app.conf
# ex: $host needs to be set as ${DOLLAR}host
ARG DOMAIN
ENV DOMAIN=$DOMAIN

ARG FLASK
ENV FLASK=$FLASK

ENV DOLLAR='$'
# Substitute contents and write a new application.conf file, which is imported by nginx.conf
RUN envsubst < /etc/nginx/conf.d/flask_app.conf > /etc/nginx/conf.d/application.conf && \
    rm /etc/nginx/conf.d/flask_app.conf
