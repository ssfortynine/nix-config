{
  description = "ssfortynine's nix flake";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # will be appended to the system-level substituters
    extra-substituters = [
      # nix community's cache server
      "https://nix-community.cachix.org"
      "https://anyrun.cachix.org"
      "https://ryan4yin.cachix.org"
      "https://cache.garnix.io"
    ];

    # will be appended to the system-level trusted-public-keys
    extra-trusted-public-keys = [
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "ryan4yin.cachix.org-1:Gbk27ZU5AYpGS9i3ssoLlwdvMIh0NxG0w8it/cv9kbU="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="

    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nur-ryan4yin = {
      url = "github:ryan4yin/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kickstart-nixvim.url = "github:JMartJonesy/kickstart.nixvim";
    # neve = {
    #  url = "github:redyf/neve";
    # };
    nixvim-config = {
    	url = "github:ssfortynine/nixvim-config";
    };
  };

  outputs = inputs @ {
    nixpkgs-stable,
    home-manager,
    ...
  }: let
    # Change the user to your own username
    linuxSystems = ["x86_64-linux"];
    forAllSystems = f: nixpkgs-stable.lib.genAttrs linuxSystems f;
    devShell = system: let
      pkgs = nixpkgs-stable.legacyPackages.${system};
    in {
      default = with pkgs;
        mkShell {
          nativeBuildInputs = with pkgs; [git vim nixd];
          shellHook = with pkgs; ''
            export EDITOR=vim
          '';
        };
    };
  in {
    devShells = forAllSystems devShell;
    nixosConfigurations."nixos" = nixpkgs-stable.lib.nixosSystem rec {
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
      system: nixpkgs-stable.legacyPackages.${system}.alejandra
    );
  };

}
