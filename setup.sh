#!/usr/bin/env bash
# [Install the Nix package manager](https://nixos.org/download/):
#sh <(curl -L https://nixos.org/nix/install) --daemon

# [Install Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone):
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

#Enable experimental features for Nix:
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

#Install [nixGL](https://github.com/nix-community/nixGL), which is the program that [enables Hyprland](https://wiki.hyprland.org/Nix/Hyprland-on-other-distros/) to run:
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
