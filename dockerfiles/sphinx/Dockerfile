FROM ubuntu:focal

LABEL maintainer="matthias.liero@gmail.com"

USER root
RUN apt-get update && apt-get install -y software-properties-common wget \
    && wget -q https://download.opensuse.org/repositories/home:freysoldt/xUbuntu_20.04/Release.key -O- |  apt-key add - \
    && add-apt-repository 'deb http://download.opensuse.org/repositories/home:/freysoldt/xUbuntu_20.04/ ./' \
    && apt update \
    && apt-get -y install sphinxdft

# add and enable the default user
ARG USER=sphinx
RUN adduser --disabled-password --gecos '' $USER
RUN adduser $USER sudo; echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chown -R $USER:$USER /home/$USER
USER $USER
ENV HOME /home/$USER
ENV USER $USER
WORKDIR $HOME
