{ config, pkgs, ... }:

{
  imports = [
    ./ide
    ./desktop 
    ./terminal
    ./shell
    ./programs
    ./packages
    ./wallpaper
  ];
  home.username = "hyy";
  home.homeDirectory = "/home/hyy";

  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.blueman-applet.enable = true;
}
