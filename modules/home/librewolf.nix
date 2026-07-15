{ config, pkgs, inputs, catppuccin, ... }:

{

  programs = {
  	librewolf = {
		enable = true;
		settings = {
			"webgl.disabled" = false;
			"privacy.resistFingerprinting" = false;
			"privacy.fingerprintingProtection" = true;
			"privacy.fingerprintingProtection.overrides" = "AllTargets, -CSSPrefersColorScheme";
			"identity.fxaccounts.enabled" = true;
		};
	};
  };
}

