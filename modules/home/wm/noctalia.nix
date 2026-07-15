{ lib, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 46;
      bar = {
	barType = "framed";
        frameRadius = 12;
	density = "comfortable";
	position = "top";
	#contentPadding = 6;
	widgets = {
	  left = [
	    {
	      id = "Clock";
	      formatHorizontal = "h:mm AP ddd, MMM dd";
	      tooltipFormat = "h:mm AP ddd, MMM dd";
	    }
	    { id = "MediaMini"; }
	  ];
	  center = [
	    {
	      id = "Workspace";
	      hideUnoccupied = true;
	    }
	  ];
	  right = [
	    { id = "Tray"; }
	    { id = "Battery"; }
	    { id = "NotificationHistory"; }
	    #{ id = "ControlCenter"; }
	    {
	      id = "SystemMonitor";
	      compactMode = false;
	      useMonospaceFont = false;
	    }
	  ];
	};
      };

      wallpaper = {
        directory = "~/Pictures/Wallpapers";
      };

      general = {
        enableShadows = false;
	clockFormat = "h:mm AP";
      };

      idle = {
        enabled = true;
	screenOffTimeout = 300;
	lockTimeoug = 300;
	suspendTimeout = 360;
      };

      dock = {
        enabled = false;
      };

      location = {
        name = "Nashua, United States";
      };
    };

    #colors = {
      #mError = lib.mkForce "#c14a4a";
      #mHover = lib.mkForce "#4c7a5d";
      #mOnError = lib.mkForce "#f2e5bc";
      #mOnHover = lib.mkForce "#f2e5bc";
      #mOnPrimary = lib.mkForce "#f2e5bc";
      #mOnSecondary = lib.mkForce "#f2e5bc";
      #mOnSurface = lib.mkForce "#654735";
      #mOnSurfaceVariant = lib.mkForce "#665c54";
      #mOnTertiary = lib.mkForce "#fbf1c7";
      #mOutline = lib.mkForce "#a89984";
      #mPrimary = lib.mkForce "#45707a";
      #mSecondary = lib.mkForce "#945380";
      #mShadow = lib.mkForce "#f2e5bc";
      #mSurface = lib.mkForce "#f2e5bc";
      #mSurfaceVariant = lib.mkForce "#ebdbb2";
      #mTertiary = lib.mkForce "#4c7a5d";
    #};
  };
}
