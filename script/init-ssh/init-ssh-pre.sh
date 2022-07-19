#!/bin/sh

echo 'init-ssh-pre'

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

cat /etc/resolv.conf

echo "search com
nameserver 8.8.8.8
nameserver 1.1.1.1
" > /etc/resolv.conf

echo 'init-ssh-pre successfully'
