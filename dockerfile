FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /home/jenkins/workspace/
RUN apt-get -y update && apt-get -y install apache2
CMD apachectl -DFOREGROUND
COPY website/website.html /var/www/html/
COPY website/style-building.css /var/www/html/