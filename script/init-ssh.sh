#!/bin/sh

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

_USER=$1

if [ "$_USER" ]; then
  USER_HOME=$(eval echo ~$_USER)
else
  USER_HOME=~
fi

SSH_PATH=$USER_HOME/.ssh
mkdir -p $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config

ID_RSA=$SSH_PATH/id_rsa
echo "$SSH_PRIVATE_KEY" > $ID_RSA
chmod $_USER $ID_RSA
chmod 600 $ID_RSA
