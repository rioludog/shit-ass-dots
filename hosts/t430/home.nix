{ config, pkgs, inputs, lib, ... }:

{
  imports = [
	
	# programs
	./../../modules/home/fastfetch.nix

	./../../modules/home/firefox.nix

	./../../modules/home/kitty.nix

	./../../modules/home/fish.nix

	./../../modules/home/keepassxc.nix

	#./../../modules/home/nixvim.nix


        # wm
	./../../modules/home/wm/rofi.nix

	./../../modules/home/wm/mako.nix

  	./../../modules/home/wm/waybar/waybar.nix
	./../../modules/home/wm/waybar/style.nix
	./../../modules/home/wm/waybar/1600.nix

	./../../modules/home/wm/hypridle.nix

	./../../modules/home/wm/swayosd.nix

	./../../modules/home/wm/xdg-desktop-portal.nix

	./../../modules/home/wm/mango.nix

	# color theme specifics
	
	./../../modules/home/colors/gruvbox/material-dark/cursor.nix
	./../../modules/home/colors/gruvbox/material-dark/icons.nix
	./../../modules/home/colors/gruvbox/material-dark/mango.nix
  ];

  home.username = "riolu";
  home.homeDirectory = "/home/riolu";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    nemo-with-extensions
    #nemo-fileroller
    file-roller
    p7zip
    pavucontrol
    powertop
    bluetui
    impala
    swaybg
    gnome-disk-utility
    feh
    pokeget-rs
    gimp

    # games
    dolphin-emu
    #starship-sf64
    hedgemodmanager


    # screenshot utils
    grim
    slurp
    swappy
  ];

  programs = {

    firefox.enable = true;

    btop.enable = true;

    mpv.enable = true;

    neovim.enable = true;

    };


  # remove gtk window controls
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = "appmenu";
    };
    "org/gnome/desktop/interface" = {
      "color-scheme" = lib.mkForce "prefer-dark";
    };
  };
}
