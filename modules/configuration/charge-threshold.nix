{ pkgs, ... }:
{
  systemd = {
    services.battery-charge-threshold = {
      description = "Set the battery charge threshold";
      wants = [ "multi-user.target" ];
      after = [ "multi-user.target" ];
      startLimitBurst = 0;
      serviceConfig = {
        Type = "oneshot";
	ExecStart = "${ pkgs.bash }/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
	Restart = "on-failure";
	RestartSec = 1;
	TimeoutStopSec = 10;
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
