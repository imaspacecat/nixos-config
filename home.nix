{ config, pkgs, ... }:

{
  imports = [
    ./module/home/dev
    ./module/home/app
    ./module/home/desktop
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
