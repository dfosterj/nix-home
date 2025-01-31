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
  homeUsername = "ded";
  homeDirectory = "/home/ded";
in
{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = homeUsername;
  home.homeDirectory = homeDirectory;



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
    clippy
    coreutils
    eza
    fd
    fira-code-nerdfont
    fish
    firefox-beta
    flameshot
    flatpak
    fzf
    git
    lsd
    neofetch
    procps
    psmisc
    skim
    starship
    stylua
    unzip
    yazi
    godot_4
    (nixGLWrap kitty)
    (nixGLWrap alacritty)
    (nixGLWrap neovide)
    (nixGLWrap wezterm)
    (nixGLWrap wofi)
    (nixGLWrap zenity)
    (nixGLWrap picom)
    bspwm
	sxhkd
	polybarFull
	dunst
    bluetuith
    pulsemixer
    feh
    dmenu
    rofi
    nwg-drawer
    clipmenu
  ];


  # Set Vim as the default editor and other session vars
  home.sessionVariables = {
    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = 1;
    GEM_HOME = "${homeDirectory}/.rubygems";
    PATH = "${pkgs.ruby}/bin:${homeDirectory}/.rubygems/bin:$PATH";
  };

  programs.git = {
    enable = true;
    userName = "David Foster";
    userEmail = "dfosterj@pm.me";
  };

  home.file.".gemrc".text = ''
    gem: --no-document
    install: --user-install
    gemhome: ${homeDirectory}/.rubygems
  '';

  home.activation.createAppLinks = lib.hm.dag.entryAfter ["writeBoundary"] ''
  DIR="$HOME/.local/share/applications"; [ ! -d "$DIR" ] && mkdir -p "$DIR" && ls -lad "$DIR" || echo "found $DIR dir, skipping.."
  ln -sf /home/$USER/.nix-profile/share/applications/* /home/$USER/.local/share/applications/
  '';
}
