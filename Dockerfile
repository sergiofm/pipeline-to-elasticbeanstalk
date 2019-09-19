FROM node:10

MAINTAINER Sergio Mendonça <sergio.mendonca@gmail.com>

RUN \
  apt-get update \
  && apt-get install -y --no-install-recommends \
  ssh \
  wget \
  git \
  vim \
  wget \
  zlib1g-dev \
  jq \
  build-essential \
  iptables \
  libapparmor1 \
  libltdl7 \
  libmcrypt-dev \
  libxml2-dev \
  zip \
  unzip \
  python \
  python-dev \
  python-pip \
  python-yaml \
  python-setuptools \
  && apt-get clean

RUN python -v
RUN pip -v

RUN npm install -g yarn --update

# Install the Elastic Beanstalk Command Line Interface (EB CLI)
RUN pip install --no-cache-dir awsebcli

# Copy the configuration file (we execute this file later through Bitbucket Pipelines)
ADD eb-init.sh /eb-init.sh
