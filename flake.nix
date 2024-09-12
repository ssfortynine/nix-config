{
  description = "ssfortynine's nix flake";
  
  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # will be appended to the system-level substituters
    extra-substituters = [
      # nix community's cache server
      "https://nix-community.cachix.org"
      "https://anyrun.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://ryan4yin.cachix.org"
      "https://cache.garnix.io"
    ];

    # will be appended to the system-level trusted-public-keys
    extra-trusted-public-keys = [
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ryan4yin.cachix.org-1:Gbk27ZU5AYpGS9i3ssoLlwdvMIh0NxG0w8it/cv9kbU="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    nur-ryan4yin = {
      url = "github:ryan4yin/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-wemeet = {
      url = "github:linyinfeng/nur-packages";        
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-xddxdd = {
      url = "github:xddxdd/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # community wayland nixpkgs
    # nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    # anyrun - a wayland launcher

    nix-gaming.url = "github:fufexan/nix-gaming";

    # my wallpapers
    wallpapers = {
      url = "github:ryan4yin/wallpapers";
      flake = false;
    };

  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixpkgs-stable, home-manager, nur-ryan4yin, wallpapers, nur-wemeet, nur-xddxdd, ... }: 
    let
      # Change the user to your own username
      linuxSystems = [ "x86_64-linux" "aarch64-linux" ];
      allSystems = linuxSystems;
      forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems) f;
      devShell = system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = with pkgs;
            mkShell {
              nativeBuildInputs = with pkgs; [ git vim nixd ];
              shellHook = with pkgs; ''
                export EDITOR=vim
              '';
            };
        };
    in {
      devShells = forAllSystems devShell;
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix       
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users.qiqi49 = import ./home.nix;
            };
          }
        ];
      };
      # Format the nix code in this flake
      formatter = forAllSystems (
      # alejandra is a nix formatter with a beautiful output
      system: nixpkgs.legacyPackages.${system}.alejandra
  );
    };

    # nixosConfigurations = {
    # nixos = nixpkgs.lib.nixosSystem {
    #    system = "x86_64-linux";
    #    modules = [
    #      ./configuration.nix
    #      home-manager.nixosModules.home-manager
    #      {
    #        home-manager.useGlobalPkgs = true;
    #        home-manager.useUserPackages = true;

    #        home-manager.users.qiqi49 = import ./home.nix;

    #        home-manager.extraSpecialArgs = inputs;
    #      }
    #    ];
    #  };
    # };
}
