FROM phusion/baseimage:0.11
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

RUN useradd -m -s /bin/bash -G sudo,docker_env dockeruser && \
    echo "dockeruser:docker" | chpasswd && \
    echo "dockeruser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    rm /etc/my_init.d/10_syslog-ng.init && \ 
    echo "cat /home/dockeruser/WELCOME" >> /home/dockeruser/.bashrc && \
    chmod +x /etc/my_init.d/set-home-permissions.sh && \
    ldconfig

USER dockeruser
ENV DOCKERUSER_HOME /home/dockeruser
RUN touch $DOCKERUSER_HOME/.sudo_as_admin_successful && \
    mkdir $DOCKERUSER_HOME/shared
VOLUME /home/dockeruser/shared

# Print something nice on entry.
COPY WELCOME $DOCKERUSER_HOME/WELCOME

WORKDIR /home/dockeruser

USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","dockeruser","/bin/bash","-l","-c"]
CMD ["/bin/bash","-i"]