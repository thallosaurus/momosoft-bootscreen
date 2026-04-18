{
  description = "momosoft plymouth theme";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-25.11";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      name = "plymouth-momosoft";
      src = ./theme;

#      dontUnpack = true;
#      phases = [ "installPhase" ];
      
      unpackPhase = ''
        mkdir -p $out/share/plymouth/themes/momosoft
        cp -r $src/. $out/share/plymouth/themes/momosoft
        chmod +x $out/share/plymouth/themes/momosoft/momosoft.plymouth
        chmod +x $out/share/plymouth/themes/momosoft/momosoft.script
        sed -i "s@\/usr\/@$out\/@" $out/share/plymouth/themes/momosoft/momosoft.plymouth
      '';
    };
  };
}
