{
  description = "My Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    nixos-wsl,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      #nixos = nixpkgs.lib.nixosSystem {
      #  system = "x86_64-linux";
      #  modules = [
      #    ./hosts/nixos/configuration.nix
      #  ];
      #};

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          ./common/common.nix
          ./hosts/wsl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = import ./hosts/wsl/home.nix;
          }
        ];
      };
    };

    darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./common/common.nix
        ./hosts/macos/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.steve = import ./common/home.nix;
        }
      ];
    };
  };
}
