# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, mangowm, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # core
      ./../../modules/configuration/minimal.nix
      ./../../modules/configuration/tuneD.nix
      ./../../modules/configuration/xkb.nix
      ./../../modules/configuration/fwupd.nix

      # userspace
      ./../../modules/configuration/soteria.nix
      ./../../modules/home/wm/xdg-desktop-portal.nix
      ./../../modules/configuration/flatpak.nix
      ./../../modules/configuration/steam.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "t14s"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # enable fstrim on LUKS drive
  boot.initrd.luks.devices = {
    luks-dab52999-aeea-4d90-8aa4-3a5530db6056 = {
      allowDiscards = true;
      bypassWorkqueues = true;
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "riolu" = import ./home.nix;
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    fonts = {
      sansSerif = {
        #package = pkgs.fira;
	name = "Fira Sans";
      };

      serif = {
        #package = pkgs.fira;
	name = "Fira Sans";
      };

      monospace = {
        #package = pkgs.fira;
	name = "Fira Mono";
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.riolu = {
    isNormalUser = true;
    description = "riolu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  security.pam.services.swaylock = {};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  nixpkgs.config.allowUnfree = true;

  #hardware.graphics = {
    #extraPackages = with pkgs; [
      #intel-media-driver
      #vpl-gpu-rt
    #];
  #};

  #environment.sessionVariables = {
    #LIBVA_DRIVER_NAME = "iHD";
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
