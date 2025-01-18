{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...  }@inputs:
  {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	{  # <- # example to add the overlay to Nixpkgs:
            nixpkgs = {
              overlays = [
                (final: prev: {
                    nvchad = inputs.nvchad4nix.homeManagerModule;
                })
              ];
            };
          }
	home-manager.nixosModules.home-manager {
	  home-manager = {
            extraSpecialArgs = { inherit inputs; };
            users.nixy = import ./home.nix;
	    useGlobalPkgs = true;
            useUserPackages = true;
          };
	}
      ];
    };
  };
}
