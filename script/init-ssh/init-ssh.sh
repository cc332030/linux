#!/bin/sh

echo
echo 'init-ssh'

set -e

if [ ! "$SSH_PRIVATE_KEY" ]; then
  echo SSH_PRIVATE_KEY not exists
  exit 1
fi

SSH_PATH=~/.ssh
mkdir -p $SSH_PATH
chmod -R 700 $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config
chmod 600 $SSH_PATH/config

echo "$SSH_PRIVATE_KEY" > $SSH_PATH/id_rsa
chmod 600 $SSH_PATH/id_rsa

echo
echo 'init-ssh successfully'
