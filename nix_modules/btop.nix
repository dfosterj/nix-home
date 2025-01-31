{ ... }: {

  programs.btop = {
    enable = true;
  };

  home.file.".config/btop/themes/nord.theme".text =
    builtins.readFile ../appdata/btop/themes/nord.theme;
}
