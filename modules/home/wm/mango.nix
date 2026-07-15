{ config, pkgs, inputs, mango, ... }:
{
  imports = [
    ./mango/autostart.nix
    ./mango/keybinds.nix
    ./mango/rules.nix
    ./mango/style.nix
  ];

  wayland.windowManager.mango.enable = true;

}
