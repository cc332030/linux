#!/bin/sh

echo 'init-ssh-pre'

set -e

# 避免连接时需要确认
mkdir -p /etc/ssh
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config


# 避免 gitee 超时
GITEE_COM=gitee.com

nslookup -version

nslookup $GITEE_COM
nslookup $GITEE_COM 8.8.8.8

GITEE_IP=$(nslookup $GITEE_COM 8.8.8.8 |
             grep "Address: " |
             awk '{print $2}')

echo "GITEE_IP: $GITEE_IP"

echo "$GITEE_IP $GITEE_COM
$(cat /etc/hosts)
" > /etc/hosts

echo 'init-ssh-pre successfully'
