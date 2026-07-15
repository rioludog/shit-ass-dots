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
	        { file = ".local/share/fish/fish_history"; how = "symlink"; }
	        { file = ".gitconfig"; how = "symlink"; }
	      ];
        directories = [
          "Downloads"
	        "Pictures"
	        "nixos"
	        "/tmp"
	        { directory = ".config/mozilla/firefox/nixos"; how = "symlink"; }
	        { directory = ".config/gh"; how = "symlink"; }
	        { directory = ".keepassxc"; how = "symlink"; }
        ];
      };
    };
  };
}
