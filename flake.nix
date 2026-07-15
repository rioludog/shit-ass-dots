{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    preservation.url = "github:nix-community/preservation";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, mangowm, stylix, home-manager, nixvim, ... }@inputs: {
  # outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.t430 = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/t430/configuration.nix
        inputs.disko.nixosModules.disko
        inputs.preservation.nixosModules.default
        ./preservation.nix
        ./disko.nix
        stylix.nixosModules.stylix
        mangowm.nixosModules.mango
        home-manager.nixosModules.home-manager
        {
        	home-manager.users.riolu = {
        		imports = [
        			# ./home.nix
        			# this doubles my home-manager configs!
        			# home.nix is already defined in configuration.nix
				      nixvim.homeModules.nixvim
				      mangowm.hmModules.mango
        		];
        	};
        }
      ];
    };
    nixosConfigurations.t14s = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/t14s/configuration.nix
        mangowm.nixosModules.mango
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.riolu = {
            imports = [
				      nixvim.homeModules.nixvim
              mangowm.hmModules.mango
            ];
          };
        }
      ];
    };
  };
}
