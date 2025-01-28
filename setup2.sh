#!/usr/bin/env bash

# Add the Home Manager channel
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

# Update all Nix channels
nix-channel --update

# install nixGL
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault

# Install Home Manager
nix-shell '<home-manager>' -A install

echo "Home Manager installation complete!"

