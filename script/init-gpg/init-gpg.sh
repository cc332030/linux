#!/bin/sh

echo 'init-gpg'

set -e

if [ ! "$GPG_PRIVATE_KEY" ]; then
  echo GPG_PRIVATE_KEY not exists
  exit 1
fi

export GPG_TTY="--pinentry-mode loopback"

user=$(whoami)

echo "user: $user"
echo "home:" ~

USER_HOME=~

GPG_PATH=$USER_HOME/.gnupg
echo "GPG_PATH: $GPG_PATH"

mkdir -p "$GPG_PATH"
chmod -R 700 "$GPG_PATH"

echo "allow-loopback-pinentry" >> "${GPG_PATH}/gpg-agent.conf"

echo "$GPG_PRIVATE_KEY" | gpg --batch --import

echo "$GPG_PASSWORD" | \
  gpg $GPG_TTY \
  --passphrase-fd 0  \
  --export-secret-keys -o "${GPG_PATH}/secring.gpg"

echo 'init-gpg successfully'
