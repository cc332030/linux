#!/bin/sh

set -e

SSH_PATH=~/.ssh
mkdir -p $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config

ROOT_ID_RSA=$SSH_PATH/id_rsa
echo "$SSH_PRIVATE_KEY" > $ROOT_ID_RSA
chmod 600 $ROOT_ID_RSA
