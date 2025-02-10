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
    nixgl.auto.nixGLDefault
    nixgl.nixVulkanIntel
	# == App ==
    brave
    chromium
    firefox-beta
    flameshot
	timeshift
    tor
    torsocks
    tor-browser
    (nixGLWrap alacritty)
    (nixGLWrap kitty)
    (nixGLWrap neovide)
    (nixGLWrap picom)
    (nixGLWrap wezterm)
    (nixGLWrap wofi)
    (nixGLWrap zenity)
    (nixVulkanIntelWrap godot_4)
	# == Lib ==
    flatpak
    bat
	cava
    glibc
    libglvnd
    xorg.libxcb
    brightnessctl
    clippy
    coreutils
    eza
    fd
    fira-code-nerdfont
    fish
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
	# == Dev ==
    gcc
    gh
    gh-dash
    glab
    gnumake
    go
    lazygit
    lua-language-server
    nodejs
    nodejs_22
    ripgrep
    ruby_3_2
    sqlite
	tmux
    vscodium
    yarn
	# == WM ==
	dunst
	escrotum
	polybarFull
	sxhkd
    bluetuith
    bspwm
    clipmenu
    dmenu
    feh
    networkmanager_dmenu
    nwg-drawer
    pulsemixer
    rofi
    slock
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
