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

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, nix4vscode, ...}@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
	        ./configuration.nix
          ./packages.nix
	        ./fonts.nix
          ./vscodium.nix
          ./podman.nix
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

          {
            nixpkgs.overlays = [nix4vscode.overlays.default];
          }
        ];
      };
    };
  };
}
