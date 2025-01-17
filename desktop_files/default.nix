{ pkgs, lib, ... }: {
  # Override the Kitty desktop entry
  xdg.desktopEntries.kitty = {
	name = "kitty";
    exec = "nixGL kitty";
    };

  # Override the Alacritty desktop entry
  xdg.desktopEntries.alacritty = {
    name = "alacritty";
    exec = "nixGL alacritty";
  };

  # Override the Neovide desktop entry
  xdg.desktopEntries.neovide = {
    name = "neovide";
    exec = "nixGL neovide";
  };

  # Override the WezTerm desktop entry
  xdg.desktopEntries.wezterm = {
    name = "wezterm";
    exec = "nixGL wezterm";
  };

}

