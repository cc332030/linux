#!/bin/sh

echo 'init-ssh-pre'

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

cat /etc/resolv.conf

sed -i '1i nameserver 8.8.8.8' /etc/resolv.conf

cat /etc/resolv.conf

echo 'init-ssh-pre successfully'
