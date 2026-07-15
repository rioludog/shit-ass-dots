{ config, pkgs, inputs, ... }:
{
  services.tuned = {
    enable = true;
    ppdSupport = true;

  };
}
