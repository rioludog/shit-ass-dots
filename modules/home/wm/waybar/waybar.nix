{ config, pkgs, inputs, ...}:

{

 programs = {
  waybar = {
  	enable = true;
	systemd.enable = false;
  	settings = {
  		mainBar = {
  			layer = "top";
  			position = "top";
  			# height = 15;
  			spacing = 3; # gaps between modules
			#margin-top = 0;
			#margin-bottom = 0;
			#margin-left = 0;
			#margin-right = 0;

			### modules ###
  			
  			modules-left = [
  				"clock"
  				"mpd"
				#"temperature"
				"memory"
  				"cpu"
  			];
  			modules-center = [
				# "pulseaudio"
  			];
  			modules-right = [
				"bluetooth"
				"network"
				"battery"
				"power-profiles-daemon"
				"idle_inhibitor"
  			];

  			### module settings ###

			"clock" = {
				format = "   {:%b %e  %I:%M %p}";
				tooltip-format = " <tt>{calendar}</tt> ";
			};

			"battery" = {
				format = "{icon} {capacity}%";
				tooltip-format = " Battery Health: {health}% ";
				format-icons = [
					" "
					" "
					" "
					" "
					" "
				];
			};

  			"memory" = {
  				interval = 2;
  				format = "  {used:0.2f} GB";
  				on-click = "kitty -e btop";
  			};

			"cpu" = {
				interval = 2;
				format = "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
				format-icons = [
					"▁"
					"▂"
					"▃"
					"▄"
					"▅"
					"▆"
					"▇"
					"█"
				];
				on-click = "kitty -e btop";

			};

			"temperature" = {
				interval = 2;
				critical-threshold = 85;
				format = "{icon} {temperatureC}°C ";
				format-icons = [
					" "
					" "
					" "
				];
			};

			"bluetooth" = {
				format-on = "";
				format-off = "";
				format-disabled = "";
				format-connected = "  {device_alias}";
				format-connected-battery = "{icon} {device_alias}";
				format-icons = [
					" "
					" "
					" "
					" "
					" "
				];
				tooltip-format-connected = " {device_alias}: {device_battery_percentage}% ";
				on-click = "kitty -e bluetui";
			};

			"network" = {
				format-wifi = "{icon} {essid}";
				format-ethernet = "{ifname}  ";
				format-icons = [
					"󰤯 "
					"󰤟 "
					"󰤢 "
					"󰤥 "
					"󰤨 "
				];
				on-click = "kitty -e impala";
				tooltip-format-wifi = " {icon} {signalStrength}%  {bandwidthUpBits}  {bandwidthDownBits} ";
			};

			"power-profiles-daemon" = {
				format-icons = {
					"performance" = "  ";
					"balanced" = "  ";
					"power-saver" = "  ";
				};
			};

			"idle_inhibitor" = {
				format = "{icon} ";
				format-icons = {
					activated = " ";
					deactivated = " ";
				};
			};


  		};
  	};
};
};
}
