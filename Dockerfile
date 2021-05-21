FROM gcr.io/lke-pprd-image-factory-abcde/trusted/lookout-base/bionic-infosec:latest
MAINTAINER "dl-cd@lookout.com"

RUN apt-get update \
    && apt-get -y install gnupg2 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BAEC34545E7460B1 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2BB5FA0F68863971 \
    && apt-get -y install ca-certificates \
    && apt-get -y install apt-transport-https wget \
    && apt-get clean \
    && apt-get update \
    && apt-get -y upgrade \
    && update-ca-certificates \
    && apt-get clean \
    && apt-get update \
    && find / -xdev -perm 600 -type f -exec chmod a-s {} \; || true

CMD ["/bin/sh"]
