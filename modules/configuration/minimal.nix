# barebones system configuration

{ config, pkgs, inputs, lib, ... }:

{
  # networking.networkmanager.enable = true;
  #networking.wireless = {
    #enable = false; # disables wpa_supplicant
    #iwd.enable = true;
  #};
  #networking.networkmanager.enable = false;

  # swap
  zramSwap = {
    enable = true;
  };

  systemd.oomd = {
    enable = true;
  };

  networking = {
    wireless = {
      iwd.enable = true;
    };
    networkmanager = {
      enable = false;
      wifi = {
        backend = "iwd";
	#powersave = true; # i think tlp handles this?
      };
    };
  };

  hardware.bluetooth.enable = true;

  # update microcode
    hardware.cpu = {
      intel.updateMicrocode = true;
      amd.updateMicrocode = true;
    };

  programs.git.enable = true;

  # disable watchdog
  boot = {
    kernelParams = [ "nowatchdog" ];
    blacklistedKernelModules = [ "iTCO_wdt" ];
  };

  # enable removable drives
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # enable pipewire and blacklist pulseaudio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # set flake path for nix helper
  programs.nh = {
    flake = "nixos/";
  };

  # set timezone
  time.timeZone = "America/New_York";

  # select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # configure keymap in X11
  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #};

  environment.systemPackages = with pkgs; [
    ffmpeg-full # for codecs
    brightnessctl
    github-cli
  ];

  # enable nix helper
  programs.nh = {
    enable = true;
    clean.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  fonts.packages = with pkgs; [
    fira
    noto-fonts
    nerd-fonts.symbols-only
    dejavu_fonts
  ];
  
  # tty polkit
  security.polkit.enable = true;

  # thermal management
  services.thermald.enable = true;

  # power management
  services.upower.enable = true;
  powerManagement = {
    enable = true;
    # powertop auto-tune
    powertop.enable = false;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # broadwell and newer
    ];
  };

}
