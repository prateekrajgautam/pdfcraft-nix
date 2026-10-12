{
  description = "A Nix flake for PDFCraft";

  inputs = {
    # Pin the Nix package collection used to build PDFCraft.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Start with the common 64-bit Intel/AMD Linux architecture.
      system = "x86_64-linux";

      # Import nixpkgs for this architecture.
      pkgs = import nixpkgs { inherit system; };

      # Evaluate the package expression with its dependencies.
      pdfcraft = pkgs.callPackage ./packages/pdfcraft.nix { };
    in
    {
      # Export the package under a named attribute.
      packages.${system} = {
        inherit pdfcraft;

        # Makes `nix build` select PDFCraft by default.
        default = pdfcraft;
      };
    };
}
