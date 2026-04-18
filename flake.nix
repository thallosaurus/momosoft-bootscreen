{
  description = "momosoft plymouth theme";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-25.11";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      name = "plymouth-momosoft";
      src = ./theme;

      dontUnpack = true;
      
      installPhase = ''
        mkdir -p $out/share/plymouth/themes/momosoft
        cp -r $src/. $out/share/plymouth/themes/momosoft
      '';
    };
  };
}
