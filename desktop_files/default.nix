{ pkgs, lib, ... }: {
  # Override the Kitty desktop entry
  xdg.desktopEntries.kitty = {
	name = "kitty";
    exec = "nixGL kitty";
    };

  # Override the Alacritty desktop entry
  xdg.desktopEntries.Alacritty = {
    name = "Alacritty";
    exec = "nixGL alacritty";
  };

  # Override the Neovide desktop entry
  xdg.desktopEntries.neovide = {
    name = "neovide";
    exec = "nixGL neovide";
  };

  # Override the WezTerm desktop entry
  xdg.desktopEntries."org.wezfurlong.wezterm" = {
    name = "wezterm";
    exec = "nixGL wezterm";
  };

}

