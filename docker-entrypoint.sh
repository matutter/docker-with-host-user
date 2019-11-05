#!/bin/bash
groupadd -f --gid=${GID} ${GROUP}
useradd -M ${USER} --uid=${UID} --gid=${GID} && \
  echo "${USER}:${PW}" | chpasswd

cd /home/$USER

su -s /bin/bash $USER
