{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
	vim_configurable.override.customize {
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          clang_complete
	      CSApprox
	      delimitMate
	      fzf-vim
	      gruvbox
	      indentLine
	      jedi-vim
	      molokai
	      neocomplete
	      nerdcommenter
	      nerdtree
	      papercolor-theme
	      rainbow
	      rust-vim
	      tabular
	      tagbar
	      ultisnips
	      vim-airline
	      vim-airline-themes
	      vim-autoformat
	      vim-code-dark
	      vim-colors-solarized
	      vim-commentary
	      vim-csharp
	      vim-endwise
	      vim-floaterm
	      vim-fugitive
	      vim-markdown
	      vim-misc
	      vim-nix
	      vim-polyglot
	      vim-projectionist
	      vim-racer
	      vim-rails
	      vim-snippets
	      vim-terraform
	      vim-trailing-whitespace
	      vim-yaml
	      vimproc
	      vimshell
	    ];
        opt = [];
      };
    vimrcConfig.customRC = ''
    " Check if ~/.vim/vimrc exists and source it
      if filereadable(expand("~/.vim/vimrc"))
        source ~/.vim/vimrc
      endif
    '';
    };
};
}
