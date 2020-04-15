FROM quay.io/mattlie82/base:latest
MAINTAINER Matthias Liero <matthias.liero@gmail.com>

USER root
WORKDIR /tmp

ARG RC_USER=none

# Non-Python utilities and libraries
RUN apt-get -qq update && \
    apt-get -y --with-new-pkgs \
        -o Dpkg::Options::="--force-confold" upgrade && \
    apt-get -y install curl && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get -y install \
        bison \
        ccache \
        cmake \
        doxygen \
        flex \
        g++ \
        gfortran \
        git \
        git-lfs \
        graphviz \
        liblapack-dev \
        libopenblas-dev \
        libpcre3-dev \
        libpng-dev \
        libgmp-dev \
        libcln-dev \
        libmpfr-dev \
        man \
        mercurial \
        nano \
        pkg-config \
        wget \
        bash-completion && \
    git lfs install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -qq update && \
    apt-get -y --with-new-pkgs \
        -o Dpkg::Options::="--force-confold" upgrade && \
    apt-get -y install \
        python3-dev \
        python3-numpy \
        python3-pytest \
        python3-scipy \
        python3-tk \
        python3-urllib3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $DOCKERUSER_HOME 
COPY WELCOME $DOCKERUSER_HOME/WELCOME

USER root