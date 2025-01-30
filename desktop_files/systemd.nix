  systemd.user.services.picom = {
    description = "Picom compositor";
    execStart = "${pkgs.picom}/bin/picom --config ${config.home.homeDirectory}/.config/picom/picom.conf";
    restart = "always";
    # Set additional options as needed (e.g., environment variables)
    environment = {
      DISPLAY = ":0";
    };
    wantedBy = [ "default.target" ];
  };
