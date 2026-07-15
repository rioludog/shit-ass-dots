{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.mango = {
    settings = {
      gappih = 6;
      gappiv = 6;
      gappoh = 12;
      gappov = 12;
      borderpx = 4;
      #bordercolor = "0x282828ff";
      #focuscolor = "0xa9b665ff";
      border_radius = 6;
      shadows = 1;
      layer_shadows = 1;

      #cursor_theme = "Capitaine Cursors (Gruvbox) - White";
      cursor_size = 24;
    };
  };
}
