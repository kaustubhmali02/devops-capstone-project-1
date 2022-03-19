FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /home/ubuntu/jenkins
RUN apt-get -y update && apt-get -y install apache2
COPY index.html /var/www/html
CMD apachectl -DFOREGROUND
