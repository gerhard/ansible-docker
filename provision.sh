#!/usr/bin/env bash

set -e
set -x

mkdir -p /root/.ssh

cat << EOF > /root/.ssh/authorized_keys
your-ssh-public-key-here
EOF

chmod 600 /root/.ssh/authorized_keys
chmod 700 /root/.ssh
