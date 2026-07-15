{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.mango = {
    systemd.enable = true;
    settings = {
      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      enable_hotarea = "0";

      layerrule = [
        "noshadow:1,layer_name:rofi"
      ];
    };
  };
}
