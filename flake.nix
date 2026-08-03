{
  description = "Mobile Robotics 2026 course site";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [ pkgs.jekyll pkgs.ruby pkgs.bundler ];
          shellHook = ''
            echo "jekyll serve --livereload   ->   http://127.0.0.1:4000"
          '';
        };
      });

      packages = forAllSystems (pkgs: {
        default = pkgs.stdenv.mkDerivation {
          pname = "mobile-robotics-site";
          version = "2026";
          src = self;
          nativeBuildInputs = [ pkgs.jekyll ];
          # Jekyll writes a cache next to $HOME, which is unset in the sandbox.
          buildPhase = ''
            export HOME=$TMPDIR
            JEKYLL_ENV=production jekyll build --source . --destination $out
          '';
          dontInstall = true;
        };
      });

      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);
    };
}
