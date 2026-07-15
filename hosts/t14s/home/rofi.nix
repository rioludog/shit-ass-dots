{ config, pkgs, lib, inputs, ...}:

{
  programs.rofi = {
    enable = true;
    font = lib.mkForce "Fira Sans Semibold 11";
    location = "top";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      window = {
        border = 0;
	padding = mkLiteral "7px 4px";
	width = mkLiteral "68%";
	anchor = mkLiteral "north";
	children = [ "horibox" ];
	y-offset = mkLiteral "-33";
	#background-color = mkLiteral "#1d2021";
      };

      horibox = {
        orientation = mkLiteral "horizontal";
	children = [ "prompt" "entry" "listview" ];
      };

      listview = {
        layout = mkLiteral "horizontal";
	spacing = mkLiteral "5px";
	lines = 100;
      };

      entry = {
        width = mkLiteral "10em";
	expand = mkLiteral"false";
	placeholder = "";
      };

      element = {
        padding = mkLiteral "0px 2px";
      };

      listview = {
        border = mkLiteral "none";
      };

      prompt = {
        enabled = mkLiteral "false";
      };

      "element normal.normal" = {
        #background-color = mkLiteral "#11111b";
      };
      
      "element alternate.normal" = {
        #background-color = mkLiteral "#11111b";
      };
      
      "element selected.normal" = {
        #background-color = mkLiteral "#11111b";
	#text-color = mkLiteral "#f9e2af";
      };
    };
  };
}
