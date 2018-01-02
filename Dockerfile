FROM python:2.7.14
MAINTAINER motionman <motionman@sinarproject.org>
MAINTAINER leto1210 version 2.7.14

RUN apt-get update -q && \
    apt-get install -qy libgeoip-dev libpcap-dev tor && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade ooniprobe

RUN mkdir ~/.ooni
ADD ooniprobe.conf ~/.ooni/
RUN ooniresources --update-inputs --update-geoip
RUN oonideckgen --country-code MY --output ~/
