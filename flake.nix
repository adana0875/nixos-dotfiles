{
  description = "A SecureBoot-enabled NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ...}@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
	  ./configuration.nix
          ./packages.nix
	  ./fonts.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
	    home-manager = {
 	      useGlobalPkgs = true;
	      useUserPackages = true;
	      users.andrew = import ./home.nix;
	      backupFileExtension = "backup";
 	    };
	  }
        ];
      };
    };
  };
}
