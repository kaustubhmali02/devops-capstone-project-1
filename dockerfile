FROM ubuntu:latest AS website
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /home/jenkins/workspace/
RUN apt-get -y update && apt-get -y install apache2
CMD apachectl -DFOREGROUND
COPY /build/website/. /var/www/html/