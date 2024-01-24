 {config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };
  # home.file.".config/kitty/kitty.conf".source = lib.mkForce ./kitty.conf;
}