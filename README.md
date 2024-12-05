# nix-home
## Installation
use nix homemanager simply as a pkg management, to work with my dotfiles and be linux fluid


[Install the Nix package manager](https://nixos.org/download/):
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

[Install Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone):
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update
nix-shell '<home-manager>' -A install
```

Enable experimental features for Nix:
```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Install [nixGL](https://github.com/nix-community/nixGL), which is the program that [enables Hyprland](https://wiki.hyprland.org/Nix/Hyprland-on-other-distros/) to run:
```bash
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
```

Clone down this repo:
```bash
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

clone repo to your user's home-manager config dir
```bash
git clone https://github.com/dfosterj/nix-hom ~/.config/home-manager
```

Copy these files to your home config:
```bash
mkdir -p ~/.config/home-manager
cp -r * ~/.config/home-manager
cp .zshrc ~/.config/home-manager
cp gbwp2.jpg ~/Pictures
```

Install the home manager config:
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

