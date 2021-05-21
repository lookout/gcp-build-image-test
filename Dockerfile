FROM gcr.io/lke-pprd-image-factory-abcde/trusted/lookout-base/bionic-infosec:latest
MAINTAINER "dl-cd@lookout.com"

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]
