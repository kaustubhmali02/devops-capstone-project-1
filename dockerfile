FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install apache2
CMD apachectl -DFOREGROUND
COPY website/* /var/www/html/
RUN ls -la /var/www/html/*