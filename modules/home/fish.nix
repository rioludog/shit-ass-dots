{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pokeget-rs
  ];
  programs.fish = {
    enable = true;
    functions.fish_greeting.body = "pokeget random --hide-name";
    shellAliases = {
      "cfg" = "sudo nvim /etc/nixos/hosts/t14s/configuration.nix";
      "hme" = "sudo nvim /etc/nixos/hosts/t14s/home.nix";
      "nrs" = "nh os switch";
      "nrb" = "nh os boot";
      "ngc" = "sudo nh clean all";
      "ncu" = "sudo nix-channel --update && nix flake update --flake /etc/nixos";
    };
  };
}
