{ config, pkgs, inputs, catppuccin, ... }:

{

services = {

 	 mako = {
  		enable = true;
  		settings = {
  			max-visible = 10;
  			layer = "top";
  			#font = "Fira Sans Semibold 11";
  			border-radius = 7;
  			max-icon-size = 48;
  			default-timeout = 10000;
  			anchor = "top-right";
  			margin = 20;
  			icon-border-radius = 5;
  		};
  	};
  };
}
