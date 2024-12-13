{ pkgs, lib, ... }:

let
  # ...
  nixgl = import <nixgl> {} ;
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe nixgl.auto.nixGLDefault} $bin \$@" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
in
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
    nixgl.auto.nixGLDefault
    # pkgs.alacritty
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
    # pkgs.kitty
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
    # pkgs.wezterm
    (nixGLWrap pkgs.kitty)
    (nixGLWrap pkgs.alacritty)
    (nixGLWrap pkgs.wezterm)
  ];

  # Set Vim as the default editor
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName = "David Foster";
    userEmail = "dfosterj@pm.me";
  };

}
