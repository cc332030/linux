#!/bin/sh

echo 'init-ssh-pre'

set -e

# 避免连接时需要确认
mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

echo 'init-ssh-pre successfully'
