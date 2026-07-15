{

  services.xserver.xkb = {
    layout = "us,us";
    variant = "colemak_dh,";
    options = "grp:lalt_lshift_toggle,caps:backspace";
  };

  console.useXkbConfig = true;

}
