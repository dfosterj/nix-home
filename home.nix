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

  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault
    bat
    brave
    brightnessctl
    chromium
    cliphist
    clippy
    coreutils
    dunst
    eza
    fd
    fira-code-nerdfont
    fish
    firefox-beta
    flameshot
    flatpak
    fzf
    gh
    gh-dash
    git
    gnumake
    go
    google-chrome
    lazygit
    lsd
    lua-language-server
    neofetch
    neovim
    nodejs_22
    procps
    psmisc
    ripgrep
    skim
    spotify
    starship
    stylua
    swaybg
    swww
    unzip
    vscodium
    waybar
    wl-clipboard
    yazi
    xwayland
    wayland
    nwg-bar
    nwg-drawer
    (nixGLWrap kitty)
    (nixGLWrap alacritty)
    (nixGLWrap wezterm)
    (nixGLWrap hyprland)
    (nixGLWrap wofi)
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
