#!/bin/bash

if ! [ -x "$(command -v autossh)" ]; then
  echo 'AutoSSH is not installed. Attempting to install'
  sudo apt install autossh -y
fi

chmod 600 id_ed25519_remote
chmod a+x tunnel.sh

./tunnel.sh
