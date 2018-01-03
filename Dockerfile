FROM python:2.7.14
MAINTAINER motionman <motionman@sinarproject.org>
MAINTAINER leto1210 version 2.7.14

RUN apt-get update -q
RUN apt-get install -yq python-pip python-dev libgeoip-dev libpcap-dev libdumbnet-dev build-essential libssl-dev libffi-dev libssl1.0.0 deb.torproject.org-keyring tor-geoipdb virtualenv torsocks tor

RUN rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install --upgrade ooniprobe

RUN mkdir ~/.ooni
ADD ooniprobe.conf ~/.ooni/
RUN ooniresources --update-inputs --update-geoip
RUN oonideckgen --country-code MY --output ~/
