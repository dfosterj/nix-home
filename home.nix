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
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault
    nixgl.nixVulkanIntel
    glibc
    libglvnd
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
    git
    google-chrome
    lsd
    neofetch
    procps
    psmisc
    skim
    starship
    stylua
    swaybg
    swww
    unzip
    waybar
    wl-clipboard
    yazi
    xwayland
    wayland
    nwg-bar
    nwg-drawer
    godot_4
    (nixGLWrap kitty)
    (nixGLWrap alacritty)
    (nixGLWrap neovide)
    (nixGLWrap wezterm)
    (nixGLWrap hyprland)
    (nixGLWrap wofi)
    (nixGLWrap zenity)
  ];

  # Set Vim as the default editor
  home.sessionVariables = {
    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  programs.git = {
    enable = true;
    userName = "David Foster";
    userEmail = "dfosterj@pm.me";
  };

  home.activation.createAppLinks = lib.hm.dag.entryAfter ["writeBoundary"] ''
  ln -sf /home/$USER/.nix-profile/share/applications/* /home/$USER/.local/share/applications/
  '';

}
