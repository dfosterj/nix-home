{ pkgs, ... }:

{
  home.packages= with pkgs; [
    bundler
    gcc
    gh
    gh-dash
    gnumake
    gnumake
    go
    lazygit
    lua-language-server
    neovim
    nodejs
    nodejs_22
    ripgrep
    rustup
    ruby_3_2
    sqlite
    vscodium
    yarn
  ];
}

