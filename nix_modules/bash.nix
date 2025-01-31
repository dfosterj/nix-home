{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      # If not running interactively, don't do anything
      case $- in
          *i*) ;;
            *) return;;
      esac

      # history
      HISTCONTROL=ignoreboth
      shopt -s histappend
      HISTSIZE=1000
      HISTFILESIZE=2000

      # window
      # update the values of LINES and COLUMNS.
      shopt -s checkwinsize
      # make less more friendly for non-text input files, see lesspipe(1)
      [ -x "${pkgs.less}/bin/lesspipe" ] && eval "$(SHELL=/bin/sh lesspipe)"

      # set a fancy prompt (non-color, unless we know we "want" color)
      case "$TERM" in
          xterm-color|*-256color) color_prompt=yes;;
      esac

      # enable color support of ls and also add handy aliases
      if [ -x "${pkgs.coreutils}/bin/dircolors" ]; then
          test -r ~/.dircolors && eval "$(${pkgs.coreutils}/bin/dircolors -b ~/.dircolors)" || eval "$(${pkgs.coreutils}/bin/dircolors -b)"
          alias ls='ls --color=auto'
          alias grep='grep --color=auto'
          alias fgrep='fgrep --color=auto'
          alias egrep='egrep --color=auto'
      fi

      # some more ls aliases
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'

      # Add an "alert" alias for long running commands.  Use like so:
      #   sleep 10; alert
      alias alert='${pkgs.libnotify}/bin/notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

      if [ -f ~/.bash_aliases ]; then
          . ~/.bash_aliases
      fi

      # bash completion
      if ! shopt -oq posix; then
        if [ -f "${pkgs.bash-completion}/share/bash-completion/bash_completion" ]; then
          . "${pkgs.bash-completion}/share/bash-completion/bash_completion"
        fi
      fi

      # env var
      export LC_ALL="C"

      # paths
      # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
      export PATH="$PATH:$HOME/.rvm/bin"

      # nvim
      export PATH="$PATH:/opt/nvim-linux64/bin"

      # rust (optional)
      # export PATH="$PATH:$HOME/.cargo/bin"

      # add dotfile bin
      export PATH="$PATH:$HOME/.dotfiles/bin"

      # dedtheme
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
  };
}
