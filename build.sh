#!/bin/bash

image_name="wk/$USER"

old_img=`docker images myimg -q`
docker build -t $image_name . || exit $?

if test -n "$old_img"; then
  echo "Deleting old image $old_img"
  docker image rm $old_img 2> /dev/null
fi

gid=`id -g`
docker run \
  -it --rm \
  -e USER=$USER \
  -e GROUP=`getent group $gid | cut -d':' -f1` \
  -e UID=`id -u` \
  -e GID=$gid \
  -e PW=${DOCKERPASSWD:=docker} \
  --mount type=bind,source=`pwd`,target=$HOME \
  $image_name
