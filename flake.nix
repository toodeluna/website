{
  description = "My personal website.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [ inputs.treefmt.flakeModule ];

      perSystem =
        { pkgs, ... }:
        {
          treefmt = {
            projectRootFile = "flake.nix";

            settings.global.exclude = [
              "flake.lock"
            ];

            programs = {
              nixfmt.enable = true;
              prettier.enable = true;
            };
          };

          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              nodejs
            ];
          };
        };
    };
}
