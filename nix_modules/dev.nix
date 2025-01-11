{ pkgs, ... }:

{
  home.packages= with pkgs; [
    gcc
    gh
    gh-dash
    gnumake
    gnumake
    go
    lazygit
    lua-language-server
    nodejs
    nodejs_22
    ripgrep
    ruby_3_2
    sqlite
    vscodium
    yarn
  ];
}

