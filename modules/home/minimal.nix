{ pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowunfree = true;
  home.packages = with pkgs; [
    #basic packages needed on all systems
    nemo-with-extensions
    file-roller
    p7zip
    gnome-disk-utility
    pavucontrol
    bluetui
    impala
    swaybg
    feh
    powertop
    pokeget-rs

    #screenshot utils
    grim
    slurp
    swappy
  ];
  programs = {
    btop.enable = true;
    mpv.enable = true;
  };
    # remove gtk window controls
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = "appmenu";
    };
    # set gtk4 dark theme
    "org/gnome/desktop/interface" = {
      "color-scheme" = lib.mkForce "prefer-dark";
    };
  };
}
