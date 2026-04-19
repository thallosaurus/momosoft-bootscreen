# Momosoft lennaXP Bootscreen for NixOS

![splash](theme/splash.png)

## How to use
Assuming you use flakes on NixOS add the following to your flake:

```nix
inputs.momosoft-bootscreen = {
    url = "github:thallosaurus/momosoft-bootscreen";
    inputs.nixpkgs.follows = "nixpkgs";
};
```

You need to add `specialArgs` to your `nixosConfiguration` like so:
```nix
outputs.nixosConfiguration.hostname = nixpkgs.lib.nixosSystem {
    # ...
    specialArgs = { inherit inputs; };
    # ...
};
```

Then, in your Plymouth Config, just add it to the theme packages
```nix
boot.plymouth = {
    enable = true;
    theme = "momosoft";
    themePackages = with pkgs; [
        inputs.momosoft-bootscreen.packages.x86_64-linux.default
    ];
}
```

Rebuild your system and reboot. It should now display the Momosoft Bootscreen