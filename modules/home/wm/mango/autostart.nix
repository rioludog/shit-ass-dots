{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.mango.settings = {
    exec-once = [
      #### remove these two lines when mangowm fixes wayland.windowManager.mango.systemd.enable
      "systemctl --user start mango-session.target"
      "soteria"


      "swaybg -i ~/Pictures/Wallpapers/gruvbox_girl.png"
      "waybar"
      #"swayosd-server"
      #"soteria"
      #"noctalia-shell"
    ];
  };
}
