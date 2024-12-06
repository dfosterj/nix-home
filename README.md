# nix-home
## Installation
this uses nix home manager simply as a pkg management, to work with my dotfiles and be linux fluid


[Run Setup to install nix, home manager, nixgl. or run manually.](https://nixos.org/download/):
```bash
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
```

[Clone this repo.](https://nixos.org/download/):
```
git clone https://github.com/dfosterj/nix-home.git
cd nix-home
```

Use vim (or whatever text editor you prefer) to edit `home.nix` and change the first few lines from `ded` to your own user:
> NOTE: Use command `whoami` if you don't know your username

> NOTE: hardcoded my user's name. sed all 'ded'. TODO: make username var throughout
```
  home.username = "ded";
  home.homeDirectory = "/home/ded";
```


[Install the home manager config.](https://nixos.org/download/):
```bash
home-manager switch
```

At this point Hyprland and all applictions in the home manager config should be installed.
Now the only thing left is to create an SDDM entry for Hyprland.  Use `sudo vim /usr/share/wayland-sessions/hyprland.desktop` to enter:
```
[Desktop Entry]
Exec=nixGL Hyprland
Name=Hyprland
```

Log out and select Hyprland in SDDM.  Enjoy!

To remove:
```
sudo systemclt stop nix-daemon
sudo systemclt disable nix-daemon
sudo rm -rf "/etc/nix" "/nix" "/root/.nix-profile" "/root/.nix-defexpr" "/root/.nix-channels" "/root/.local/state/nix" "/root/.cache/nix" "/home/$USER/.nix-profile" "/home/$USER/.nix-defexpr" "/home/$USER/.nix-channels" "/home/$USER/.local/state/nix" "/home/$USER/.cache/nix"
```

