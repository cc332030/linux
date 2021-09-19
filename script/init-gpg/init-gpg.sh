#!/bin/sh

set -e

export GPG_TTY="--pinentry-mode loopback"

if [ ! "$GPG_PRIVATE_KEY" ]; then
  echo GPG_PRIVATE_KEY not exists
  exit 1
fi

GPG_FOLDER=~/.gnupg

mkdir -p $GPG_FOLDER
chmod -R 700 $GPG_FOLDER

echo "allow-loopback-pinentry" >> "${GPG_FOLDER}/gpg-agent.conf"

echo "$GPG_PRIVATE_KEY" | gpg --batch --import

echo "$GPG_PASSWORD" | \
  gpg $GPG_TTY \
  --passphrase-fd 0  \
  --export-secret-keys -o "${GPG_FOLDER}/secring.gpg"
