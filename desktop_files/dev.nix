{ ... }: {

  home.file.".gemrc".text = ''
    gem: --no-document
    install: --user-install
    gemhome: $HOME/.rubygems
  '';
}
