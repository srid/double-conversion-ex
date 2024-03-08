{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.haskell-flake.flakeModule ];

      perSystem = { self', pkgs, ... }: {

        haskellProjects.default = {
          devShell = {
            tools = hp: {
              hlint = null;
              fourmolu = null;
              haskell-language-server = null;
              ghcid = null;
            };
            hlsCheck.enable = false;
          };
        };

        formatter = pkgs.nixpkgs-fmt;
        packages.default = self'.packages.double-conversion-ex;
      };
    };
}
