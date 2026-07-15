{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pokeget-rs
  ];
  programs.fish = {
    enable = true;
    functions.fish_greeting.body = "pokeget random --hide-name";
    shellAliases = {
      "nrs" = "nh os switch";
      "nrb" = "nh os boot";
      "ngc" = "sudo nh clean all";
      "ncu" = "sudo nix-channel --update && nix flake update --flake /etc/nixos";
    };
  };
}
