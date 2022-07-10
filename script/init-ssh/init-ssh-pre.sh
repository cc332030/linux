#!/bin/sh

echo 'init-ssh-pre'

set -e

mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

echo 'init-ssh-pre successfully'
