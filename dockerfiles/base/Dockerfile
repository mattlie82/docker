FROM ubuntu:bionic
MAINTAINER Matthias Liero <matthias.liero@gmail.com>

# Get Ubuntu updates
USER root
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get -y install locales sudo && \
    echo "C.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Set locale environment
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8

COPY set-home-permissions.sh /etc/my_init.d/set-home-permissions.sh

ARG USER=dockeruser
ENV HOME /home/$USER
ENV USER $USER

RUN adduser --disabled-password --gecos '' $USER
RUN adduser $USER sudo; echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    echo "cat $HOME/WELCOME" >> $HOME/.bashrc && \
    chmod +x /etc/my_init.d/set-home-permissions.sh && \
    ldconfig



USER $USER

RUN touch $HOME/.sudo_as_admin_successful && \
    mkdir $HOME/shared
VOLUME $HOME/shared

# Print something nice on entry.
COPY WELCOME $HOME/WELCOME

WORKDIR $HOME 

USER root

CMD ["/bin/bash","-i"]