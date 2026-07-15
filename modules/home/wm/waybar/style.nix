{ config, pkgs, inputs, ... }:
{
  programs.waybar.style = ''
    * {
      font-family: "Fira Sans Semibold", "Font Awesome 7 Free";
      font-size: 14px;
      min-height: 30px;
    }

    window#waybar {
      background: alpha(@base00, 0.999999);
      border-radius: 0px 0px 12px 12px;
    }

    #bluetooth.diabled, #bluetooth.off {
      color: @base02;
    }

    #workspaces {
    }

    .modules-center #workspaces button.active {
      background-color: @base0D;
      color: @base00;
    }
    
    .modules-center #workspaces button, .modules-center #workspaces button.focused, .modules-center #workspaces button.active, .modules-center #workspaces button.urgent {
      border-bottom: none;
      margin: 2px;
      padding: 0px 7px 0px 7px;
      border-radius: 6;
    }

    #clock, #mpd, #cpu, #memory, #bluetooth, #network, #battery {
    }

  '';
  programs.waybar.settings.mainBar = {
    #margin-top = 12;
    margin-top = 0;
    "temperature" = {
      #hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
      #hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/[[:print:]]*/temp1_input";
      hwmon-path = "/sys/class/thermal/thermal_zone1/temp";
    };

    modules-center = [ "ext/workspaces" ];

    "ext/workspaces" = {
        on-click = "activate";
	cursor = false;
	};
    };
}
