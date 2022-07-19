#!/bin/sh

echo 'init-ssh-pre'

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

cat /etc/resolv.conf

echo "nameserver 8.8.8.8
$(cat /etc/resolv.conf)
" > /etc/resolv.conf

cat /etc/resolv.conf

echo 'init-ssh-pre successfully'
