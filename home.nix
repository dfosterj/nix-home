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
  nixVulkanIntelWrap = pkg: pkgs.runCommand "${pkg.name}-nixvulkantinel-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe nixgl.nixVulkanIntel} $bin \$@" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
  homeUsername = "ded";
  homeDirectory = "/home/ded";
in
{
  home.username = homeUsername;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.allowUnfree = true;


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    # == NixGL ==
    nixgl.auto.nixGLDefault
    nixgl.nixVulkanIntel
    # == App ==
    (nixGLWrap alacritty)
    (nixGLWrap kitty)
    (nixGLWrap neovide)
    (nixGLWrap picom)
    (nixGLWrap wezterm)
    (nixGLWrap wofi)
    (nixGLWrap zenity)
    bat
    bluetuith
    brave
    brightnessctl
    cava
    chromium
    cliphist
    clipmenu
    clippy
    dunst
    escrotum
    eza
    fd
    firefox-beta
    fish
    flameshot
    flatpak
    fzf
    godot_4
    lazygit
    lsd
    neofetch
    networkmanager_dmenu
    nix-search-cli
    nwg-drawer
    rofi
    skim
    slock
    starship
    tidal-hifi
    tmux
    tor
    tor-browser
    torsocks
    unzip
    vscodium
    waybar
    xautolock
    yazi
    # == Lib ==
    coreutils
    glibc
    killall
    libglvnd
    procps
    psmisc
    pulsemixer
    ripgrep
    # == Dev ==
    gcc
    gh
    gh-dash
    git
    glab
    gnumake
    go
    lua-language-server
    nodejs
    nodejs_22
    python3Full
    ruby_3_2
    sqlite
    stylua
    vimPlugins.vim-plug
    yarn
    # == WM ==
    bspwm
    dmenu
    feh
    polybarFull
    sway
    swww
    sxhkd
    timeshift
    xorg.libxcb
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
