#!/bin/sh

echo 'init-ssh'

set -e

if [ ! "$SSH_PRIVATE_KEY" ]; then
  echo SSH_PRIVATE_KEY not exists
  exit 1
fi

WORK_PATH=~/.ssh
echo "WORK_PATH: ${WORK_PATH}"

mkdir -p "$WORK_PATH"
chmod -R 700 "$WORK_PATH"

echo "
Host *
    ConnectTimeout 10
" >>"$WORK_PATH/config"
chmod 600 "$WORK_PATH/config"

ID_RSA_PATH="$WORK_PATH/id_rsa"

echo "$SSH_PRIVATE_KEY" >"$ID_RSA_PATH"
chmod 600 "$ID_RSA_PATH"

USER=$(whoami)
if [ "root" = "$USER" ]; then
  USER_HOME=/root
else
  USER_HOME=/home/$USER
fi
echo "USER_HOME: ${USER_HOME}"

if [ ! ~ = "$USER_HOME" ]; then
  ln -s $WORK_PATH "$USER_HOME"
fi

echo 'init-ssh successfully'
