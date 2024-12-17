{ pkgs, ... }:

{
  home.packages= with pkgs; [
    ruby_3_2
    bundler
    sqlite
    nodejs
    yarn
    gcc
    gnumake
  ];
}

