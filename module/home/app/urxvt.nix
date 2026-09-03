{ pkgs, ... }:

{
  home.packages = [ pkgs.rxvt-unicode ];

  xresources.properties = {
    "URxvt.font" = "xft:JetBrainsMono Nerd Font Mono:size=12:antialias=true";
    "URxvt.boldFont" = "xft:JetBrainsMono Nerd Font Mono:bold:size=12:antialias=true";
    "URxvt.depth" = 32;
    "URxvt.background" = "#1e1e2e";
    "URxvt.foreground" = "#cdd6f4";
    "URxvt.cursorColor" = "#f5e0e0";
    "URxvt.color0" = "#45475a";
    "URxvt.color1" = "#f38ba8";
    "URxvt.color2" = "#a6e3a1";
    "URxvt.color3" = "#f9e2af";
    "URxvt.color4" = "#89b4fa";
    "URxvt.color5" = "#f5c2e7";
    "URxvt.color6" = "#94e2d5";
    "URxvt.color7" = "#bac2de";
    "URxvt.color8" = "#585b70";
    "URxvt.color9" = "#f38ba8";
    "URxvt.color10" = "#a6e3a1";
    "URxvt.color11" = "#f9e2af";
    "URxvt.color12" = "#89b4fa";
    "URxvt.color13" = "#f5c2e7";
    "URxvt.color14" = "#94e2d5";
    "URxvt.color15" = "#a6adc8";
    "URxvt.saveLines" = 10000;
    "URxvt.scrollBar" = false;
    "URxvt.cursorBlink" = true;
  };
}
