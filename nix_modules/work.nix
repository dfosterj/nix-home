{ pkgs, ... }:
{
  home.packages= with pkgs; [
    genymotion
    zoom
    _1password-gui
  ];
}

