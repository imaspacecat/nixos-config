{ pkgs, ... }:

{
  home.packages = [ pkgs.rxvt-unicode ];

  xresources.properties = {
    "URxvt.font" = "xft:JetBrainsMono Nerd Font Mono:size=12:antialias=true";
    "URxvt.boldFont" = "xft:JetBrainsMono Nerd Font Mono:bold:size=12:antialias=true";
    "URxvt.depth" = 32;
    "URxvt.background" = "#222222";
    "URxvt.foreground" = "#ffffff";
    "URxvt.cursorColor" = "#ffffff";
    "URxvt.color0" = "#222222";
    "URxvt.color1" = "#d16969";
    "URxvt.color2" = "#98c379";
    "URxvt.color3" = "#d7ba7d";
    "URxvt.color4" = "#61afef";
    "URxvt.color5" = "#c678dd";
    "URxvt.color6" = "#56b6c2";
    "URxvt.color7" = "#dcdfe4";
    "URxvt.color8" = "#444444";
    "URxvt.color9" = "#e06c75";
    "URxvt.color10" = "#a6e3a1";
    "URxvt.color11" = "#f9e2af";
    "URxvt.color12" = "#89b4fa";
    "URxvt.color13" = "#f5c2e7";
    "URxvt.color14" = "#94e2d5";
    "URxvt.color15" = "#ffffff";
    "URxvt.saveLines" = 10000;
    "URxvt.scrollBar" = false;
    "URxvt.cursorBlink" = true;
  };
}
