{ pkgs, ... }:

{
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
    discord-ptb
    usbutils
    rofi
  ];

  home.stateVersion = "26.05";
}
