#!/usr/bin/env bash

sudo systemctl stop nix-daemon
sudo systemctl disable nix-daemon
sudo rm -rf "/etc/nix" "/nix" "/root/.nix-profile" "/root/.nix-defexpr" "/root/.nix-channels" "/root/.local/state/nix" "/root/.cache/nix" "/home/$USER/.nix-profile" "/home/$USER/.nix-defexpr" "/home/$USER/.nix-channels" "/home/$USER/.local/state/nix" "/home/$USER/.cache/nix"
sudo rm -rf /etc/bash.bashrc.backup-before-nix  /etc/bashrc.backup-before-nix  /etc/zshrc.backup-before-nix /etc/profile.d/nix.sh /etc/profile.d/nix.sh.backup-before-nix /etc/zsh/*
