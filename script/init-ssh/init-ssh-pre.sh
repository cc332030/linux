#!/bin/sh

echo
echo 'init-ssh-pre'

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

echo
echo 'init-ssh-pre successfully'
