{ config, pkgs, inputs, lib, ... }:

{
  imports = [

  # import basic hm config
  ./../../modules/home/minimal.nix
	
	# programs
	./../../modules/home/fastfetch.nix

	./../../modules/home/firefox.nix

	./../../modules/home/kitty.nix

	./../../modules/home/fish.nix

	./../../modules/home/keepassxc.nix

	./../../modules/home/nixvim.nix


        # wm
	./../../modules/home/wm/rofi.nix

	./../../modules/home/wm/mako.nix

  ./../../modules/home/wm/waybar/waybar.nix
	./../../modules/home/wm/waybar/style.nix
	./../../modules/home/wm/waybar/1920.nix

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
  home.packages = with pkgs; [
    gimp

    # games
    dolphin-emu
    #starship-sf64
    hedgemodmanager
  ];
}
