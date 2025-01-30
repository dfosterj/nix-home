#!/usr/bin/env bash

# Install Nix as a multi-user (daemon) installation
sh <(curl -L https://nixos.org/nix/install) --daemon

# Refresh the shell environment to make `nix` command available
if [ -f /nix/var/nix/profiles/default/bin/nix ];then
echo "found nix refreshing shell env to access new nix cmds..."
echo "exit and start a new shell session to have nix cmds avail..."
else
echo "ERROR nix path not found. Something went wrong.."
exit 1
fi
