#!/bin/bash
# User can pass e.g. --env HOST_UID=1003 so that UID in the container matches
# with the UID on the host. This is useful for Linux users, Mac and Windows
# already do transparent mapping of shared volumes.
if [ "$HOST_UID" ]; then
    usermod -u $HOST_UID dockeruser
fi
if [ "$HOST_GID" ]; then
    groupmod -g $HOST_GID dockeruser
fi

find /home/dockeruser -maxdepth 1 | sed "1d" | grep -v "/home/dockeruser/shared" | xargs chown -R dockeruser:dockeruser 2> /dev/null || true
