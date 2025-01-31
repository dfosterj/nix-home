{ ... }: {

  programs.btop = {
    enable = true;
  };

  home.file.".config/btop/themes/nord.theme".text =
    builtins.readFile ../dotfiles/btop/themes/nord.theme;
}
