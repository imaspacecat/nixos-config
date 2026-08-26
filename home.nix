{ config, pkgs, ... }:

{
  imports = [
    ./module/home
  ];

  home.username = "spacecat";
  home.homeDirectory = "/home/spacecat";

  home.packages = with pkgs; [
    fastfetch
    btop
    xclip
    maim
    jq
    keepassxc
    brightnessctl
    tree
  ];

  home.stateVersion = "26.05";
}
