{ config, pkgs, lib, ... } @ args:{
    imports = [
        ./configuration.nix
        ./proxy.nix
    ];
    nixpkgs.overlays = import ../overlays args;
}