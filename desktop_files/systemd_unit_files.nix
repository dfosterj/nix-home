{  pkgs, ... }:

{
  systemd.user.services.dotfile-link-check = {
    Unit = {
      Description = "Dotfiles Link Check Service for %u";
      After = [ "network.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash -c 'while true; do $HOME/.dotfiles/bin/systemd_dotfile_link_check_service.sh >> /var/log/dotfiles_%u.log 2>&1; sleep 300; done'";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
