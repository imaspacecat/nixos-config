{ config, pkgs, ... }:

{
  home.username = "spacecat";
  home.homeDirectory = "/home/spacecat";
  # move to base.nix
  home.packages = with pkgs; [
    fastfetch
    btop
    xclip
    maim
    jq
    keepassxc
    brightnessctl
    tree
    discord-ptb
    usbutils
  ];

  home.stateVersion = "26.05";
}
