#!/bin/sh

set -e

sudo mkdir -p /etc/ssh
sudo echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

SSH_PATH=~/.ssh
mkdir -p $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config

ID_RSA=$SSH_PATH/id_rsa
echo "$SSH_PRIVATE_KEY"
echo "$SSH_PRIVATE_KEY" > $ID_RSA
chmod 600 $ID_RSA
