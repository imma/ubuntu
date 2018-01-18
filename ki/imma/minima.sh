#!/usr/bin/env bash

set -exfu
umask 0022

function main {
  sudo chgrp docker /var/run/docker.sock
  block sync
}

if [[ "$(id -u -n)" == "root" ]]; then
  if [[ -r "$HOME/.ssh/ssh_auth_sock" ]]; then
    export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
  fi
  ssh -A -o BatchMode=yes -o StrictHostKeyChecking=no ubuntu@localhost "$0"
else
  main "$@"
fi
