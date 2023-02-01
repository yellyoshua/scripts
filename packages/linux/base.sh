#!/bin/bash


# Install libssl1.1
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo apt install -y /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
rm /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# Install libraries
apt install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common \
		wget \
		vim \
		git \
		unzip \
    postfix \
    graphicsmagick \
    imagemagick \
    ffmpeg \
    xsltproc