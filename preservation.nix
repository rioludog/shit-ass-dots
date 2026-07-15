{
  boot.tmp.cleanOnBoot = true;

  preservation = {
    enable = true;
    preserveAt."/persistent" = {

      files = [
        { file = "/etc/machine-id"; inInitrd = true; how="symlink"; }
	      { file = "/var/lib/swapfile"; }
      ];

      directories = [
        "/var/lib/systemd/timers"
        "/var/lib/nixos"
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/iwd"
      ];

      users.riolu = {
        files = [ 
	        ".local/share/fish/fish_history"
	        { file = ".gitconfig"; how = "symlink"; }
	      ];
        directories = [
          "Downloads"
	        "Pictures"
	        "nixos"
	        "/tmp"
	        ".config/mozilla/firefox/nixos"
	        ".keepassxc"
        ];
      };
    };
  };
}
