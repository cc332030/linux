#!/bin/sh

echo 'init-gpg'

set -e

if [ ! "$GPG_PRIVATE_KEY" ]; then
  echo GPG_PRIVATE_KEY not exists
  exit 1
fi

export GPG_TTY="--pinentry-mode loopback"

WORK_PATH=~/.gnupg
mkdir -p "$GPG_PATH"
chmod -R 700 "$GPG_PATH"

echo "allow-loopback-pinentry" >> "${WORK_PATH}/gpg-agent.conf"

echo "$GPG_PRIVATE_KEY" | gpg --batch --import

echo "$GPG_PASSWORD" | \
  gpg $GPG_TTY \
  --passphrase-fd 0  \
  --export-secret-keys -o "${WORK_PATH}/secring.gpg"



USER=$(whoami)
if [ "root" = "$USER" ]
then
  USER_HOME=/root
else
  USER_HOME=/home/$USER
fi

if [ ! ~ = "$USER_HOME" ]
then
  ln -s $WORK_PATH "$USER_HOME"
fi

echo 'init-gpg successfully'
