{ config, pkgs, lib, ...}:

{
  home.stateVersion = "24.11";
  home.username = "ded";
  home.homeDirectory = "/home/ded";

  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.allowUnfree = true;

  imports = [
	./nix_modules
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  # Set Vim as the default editor and other session vars
  home.sessionVariables = {
    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = 1;
    GEM_HOME = "${config.home.homeDirectory}/.rubygems";
    PATH = "${pkgs.ruby}/bin:${config.home.homeDirectory}/.rubygems/bin:$PATH";
  };

  programs.git = {
    enable = true;
    userName = "David Foster";
    userEmail = "dfosterj@pm.me";
  };

  home.file.".gemrc".text = ''
    gem: --no-document
    install: --user-install
    gemhome: ${config.home.homeDirectory}/.rubygems
  '';

}
