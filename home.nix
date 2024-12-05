{ pkgs, ... }:
{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ded";
  home.homeDirectory = "/home/ded";

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  home.packages = [
    pkgs.bat
    pkgs.brave
    pkgs.brightnessctl
    pkgs.chromium
    pkgs.cliphist
    pkgs.clippy
    pkgs.coreutils
    pkgs.dunst
    pkgs.eza
    pkgs.fd
    pkgs.fira-code-nerdfont
    pkgs.fish
    pkgs.flameshot
    pkgs.flatpak
    pkgs.fzf
    pkgs.gh
    pkgs.gh-dash
    pkgs.git
    pkgs.gnumake
    pkgs.go
    pkgs.google-chrome
    pkgs.kitty
    pkgs.lazygit
    pkgs.lsd
    pkgs.lua-language-server
    pkgs.neofetch
    pkgs.neovim
    pkgs.nodejs_22
    pkgs.procps
    pkgs.psmisc
    pkgs.ripgrep
    pkgs.skim
    pkgs.spotify
    pkgs.starship
    pkgs.stylua
    pkgs.swaybg
    pkgs.swww
    pkgs.unzip
    pkgs.vscodium
    pkgs.waybar
    pkgs.wl-clipboard
    pkgs.yazi
    pkgs.wezterm
  ];
}
