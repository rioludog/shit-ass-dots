{ config, pkgs, inputs, ... }:
{
  programs.swaylock = {
    enable = true;
  };

  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
    settings = {
      general = {
        lock_cmd = "swaylock";
	before_sleep_cmd = "swaylock";
      };
      listener = [
        {
	  on-timeout = "swaylock";
	  timeout = 300;
	}
	{
	  on-timeout = "systemctl sleep";
	  timeout = 360;
	}
      ];
    };
  };
  home.packages = with pkgs; [
    hypridle
  ];
}
