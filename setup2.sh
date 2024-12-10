#!/bin/bash

sudo systemctl start nix-daemon
sudo systemctl enable nix-daemon

# Add the Home Manager channel
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

# Update all Nix channels
nix-channel --update

# Install Home Manager
nix-shell '<home-manager>' -A install

echo "Home Manager installation complete!"

