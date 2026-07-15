{ config, pkgs, inputs, catppuccin, ... }:

{

 programs = {
  fastfetch = {
  	enable = true;
  	settings = {
  	  logo = {
  	  	type = "none";
  	  	# source = "nixos-small";
  	  };
  	  display = {
  	  	separator = "  ";
  	  	key = {
  	  		type = "icon";
  	  		paddingLeft = 2;
  	  	};
  	  };
  	  modules = [
        {
        	type = "custom";
        	format = "         |\\__/,|   (`\"";
        }
        {
        	type = "custom";
        	format = "       _.|^ ^  |_   ) )";
        }
        {
        	type = "custom";
        	format = "┌─────(((───(((─────────────┐";
        }
  	    {
  	  		type = "os";
  	  		format = "{pretty-name}";
  	  	}
  	  	{
  	  		type = "wm";
  	  		format = "{pretty-name} :3";
  	  	}
  	  	#{
  	  		#type = "packages";
  	  		# format = "{1} (nixpkgs)";
  	  	#}
  	  	{
  	  		type = "uptime";
  	  	}
  	  	{
  	  		type = "cpu";
  	  		format = "Intel i7-3632QM";
  	  	}
  	  	{
  	  		type = "gpu";
  	  		format = "{name}";
			hideType = "integrated";
  	  	}
  	  	{
  	  		type = "custom";
  	  		format = "└───────────────────────────┘";
  	  	}
  	  	{
  	  		type = "colors";
  	  		paddingLeft = 7;
  	  		symbol = "circle";
  	  	}
  	  ];
  	};
     };
  };

}
