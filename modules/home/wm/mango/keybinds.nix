{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.mango = {
    settings = {
      bind = [
      "SUPER,Return,spawn,kitty"
      "SUPER,q,killclient"
      "SUPER,r,reload_config"
      "SUPER,space,spawn,rofi -show drun"
      "SUPER,m,quit"
      "SUPER+SHIFT,m,spawn, poweroff"

      "SUPER,b,spawn,firefox"
      "SUPER,c,spawn,nemo"

      "NONE,XF86AudioRaiseVolume,spawn,swayosd-client --output-volume raise"
      "NONE,XF86AudioLowerVolume,spawn,swayosd-client --output-volume lower"
      "NONE,XF86AudioMute,spawn,swayosd-client --output-volume mute-toggle"
      "NONE,XF86AudioMicMute,spawn,swayosd-client --input-volume mute-toggle"

      "NONE,XF86MonBrightnessUp,spawn,swayosd-client --brightness raise"
      "NONE,XF86MonBrightnessDown,spawn,swayosd-client --brightness lower"

      "NONE,XF86AudioPlay,spawn,playerctl play-pause"
      "NONE,XF86AudioNext,spawn,playerctl next"
      "NONE,XF86AudioPrev,spawn,playerctl previous"


      "SUPER,v,togglefloating"
      "SUPER,f,togglefullscreen"

      
      "SUPER,h,focusdir,left"
      "SUPER,j,focusdir,down"
      "SUPER,k,focusdir,up"
      "SUPER,l,focusdir,right"

      "SUPER+SHIFT,h,exchange_client,left"
      "SUPER+SHIFT,j,exchange_client,down"
      "SUPER+SHIFT,k,exchange_client,up"
      "SUPER+SHIFT,l,exchange_client,right"

      "SUPER,1,view,1,0"
      "SUPER,2,view,2,0"
      "SUPER,3,view,3,0"
      "SUPER,4,view,4,0"
      "SUPER,5,view,5,0"
      "SUPER,6,view,6,0"
      "SUPER,7,view,7,0"
      "SUPER,8,view,8,0"
      "SUPER,9,view,9,0"

      "SUPER+CTRL,1,tag,1,0"
      "SUPER+CTRL,2,tag,2,0"
      "SUPER+CTRL,3,tag,3,0"
      "SUPER+CTRL,4,tag,4,0"
      "SUPER+CTRL,5,tag,5,0"
      "SUPER+CTRL,6,tag,6,0"
      "SUPER+CTRL,7,tag,7,0"
      "SUPER+CTRL,8,tag,8,0"
      "SUPER+CTRL,9,tag,9,0"

      "SUPER+SHIFT,1,tagsilent,1,0"
      "SUPER+SHIFT,2,tagsilent,2,0"
      "SUPER+SHIFT,3,tagsilent,3,0"
      "SUPER+SHIFT,4,tagsilent,4,0"
      "SUPER+SHIFT,5,tagsilent,5,0"
      "SUPER+SHIFT,6,tagsilent,6,0"
      "SUPER+SHIFT,7,tagsilent,7,0"
      "SUPER+SHIFT,8,tagsilent,8,0"
      "SUPER+SHIFT,9,tagsilent,9,0"

      "NONE,Print,spawn,sh -c 'grim -g \"$(slurp)\" - | swappy -f -'"
      ];

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
	"SUPER,btn_right,moveresize,curresize"
      ];

      gesturebind = [
        "none,right,3,viewtoleft"
	"none,left,3,viewtoright"
	"none,up,3,toggleoverview"
	"none,down,3,toggleoverview"
      ];

      switchbind = [
        "fold,spawn,hyprlock --no-fade-in"
      ];

      trackpad_natural_scrolling = 1;
      click_method = 2; # 1 button areas, 2 clickfinger
      xkb_rules_layout = "us,us";
      xkb_rules_variant = "colemak_dh,";
      xkb_rules_options = "grp:lalt_lshift_toggle,caps:backspace";
    };

  };
}
