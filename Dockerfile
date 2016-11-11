FROM ubuntu

MAINTAINER Zac Flamig "zflamig@uchicago.edu"

#ARG http_proxy=http://cloud-proxy:3128
#ARG https_proxy=http://cloud-proxy:3128

# Update aptitude with new repo
RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 apt-get update

# Install software 
RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 apt-get install -y \
	git \
	libjasper-dev \
	libproj-dev

RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 apt-get install -y \
        gcc \
	build-essential \
	make

RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 apt-get install -y \
        libjpeg-dev \
	libtiff-dev \
	gfortran \
	f2c \
	libf2c2-dev

RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 apt-get install -y \
        imagemagick

RUN http_proxy=http://cloud-proxy:3128 https_proxy=http://cloud-proxy:3128 git clone https://github.com/zflamig/gvartool.git /gvar #regrab3
RUN cd /gvar && make

ENTRYPOINT ["/gvar/gvar"]
CMD []
