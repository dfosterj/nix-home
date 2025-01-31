{ ... }: {

  programs.bash = {
    enable = true;
  };

  home.file.".bashrc".text =
    builtins.readFile ../dotfiles/bash/bashrc;
}
