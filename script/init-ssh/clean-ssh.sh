#!/bin/sh

echo 'clean-ssh'

set -e

if [ ! "$SSH_PRIVATE_KEY" ]; then
  echo SSH_PRIVATE_KEY not exists
  exit 1
fi

user=$(whoami)

echo "user: $user"
echo "home:" ~

if [ "root" = "$user" ]
then
  USER_HOME=/root
else
  USER_HOME=/home/$user
fi

SSH_PATH=$USER_HOME/.ssh
echo "SSH_PATH: $SSH_PATH"

echo "clean SSH_PATH: $SSH_PATH"
ls -lh "$SSH_PATH"
rm -rf "$SSH_PATH"

if [ ! ~ = "$USER_HOME" ]
then
  CLEAN_PATH=~/.ssh
  echo "clean $CLEAN_PATH"
  ls -lh $CLEAN_PATH
  rm -rf $CLEAN_PATH
fi

echo 'clean-ssh successfully'
