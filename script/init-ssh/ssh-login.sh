#!/bin/sh

# curl -sL https://github.com/cc332030/linux/raw/refs/heads/master/script/init-ssh/ssh-login.sh | sh

USER_NAME=${1:-c332030}
echo "USER_NAME: ${USER_NAME}"

KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOpdS1sNug+B1QHIlk+lBKXaT81wEQgLvF82OFkA0FQI ${USER_NAME}"

if ! grep -qF "$KEY" ~/.ssh/authorized_keys 2>/dev/null; then
    echo "$KEY" >> ~/.ssh/authorized_keys
fi

cat ~/.ssh/authorized_keys
