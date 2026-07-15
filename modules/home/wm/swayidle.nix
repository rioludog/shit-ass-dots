{ config, pkgs, inputs, ... }:
{
  programs.swaylock = {
    enable = true;
  };

  services.swayidle = {
    enable = true;
    systemdTargets = [
      "graphical-session.target"
    ];
    timeouts = [
      {
        timeout = 300;
	command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];

    events = [
      {
        event = "before-sleep";
	command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };
}
