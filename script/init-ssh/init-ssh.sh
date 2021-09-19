#!/bin/sh

set -e

SSH_PATH=~/.ssh
mkdir -p $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config
chmod 600 $SSH_PATH/config

echo "$SSH_PRIVATE_KEY" > $SSH_PATH/id_rsa
chmod 600 $SSH_PATH/id_rsa
