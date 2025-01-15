{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            pkg-config
            zsh
            gcc
            crystal
            libGL
            libGLU
            glm
            glfw
            glew
            mesa
            pcre
          ];

          shellHook = ''
            alias ls="ls --color=auto"
            export PKG_CONFIG_PATH=${pkgs.lib.makeLibraryPath [
              libGL
              libGLU
              glm
              glfw
              mesa
              pcre
            ]}:$PKG_CONFIG_PATH

            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
              libGL
              libGLU
              glm
              glfw
              mesa
              pcre
            ]}:$LD_LIBRARY_PATH
          '';
        };
      });
}
