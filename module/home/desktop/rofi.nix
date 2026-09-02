{ config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "Applications";
      display-run = "Run";
      display-window = "Windows";
      matching = "fuzzy";
    };

    theme = {
      "*" = {
        background-color = mkLiteral "#222222";
        foreground-color = mkLiteral "#ffffff";
        border-color = mkLiteral "#444444";
        font = "JetBrainsMono Nerd Font 10";
      };

      "window" = {
        width = 600;
        border = 1;
        padding = 20;
        border-radius = 0;
        border-color = mkLiteral "#ffffff";
      };

      "mainbox" = {
        spacing = 15;
        children = map mkLiteral [ "inputbar" "message" "listview" ];
      };

      "inputbar" = {
        padding = 8;
        spacing = 8;
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        text-color = mkLiteral "#ffffff";
      };

      "entry" = {
        placeholder = "Search";
        text-color = mkLiteral "#ffffff";
        placeholder-color = mkLiteral "#ffffff";
      };

      "listview" = {
        columns = 1;
        lines = 8;
        spacing = 4;
        fixed-height = true;
      };

      "element" = {
        padding = 8;
        spacing = 8;
        border = mkLiteral "0 0 0 3px";
        border-color = mkLiteral "transparent";
      };

      "element selected" = {
        background-color = mkLiteral "#222222";
        text-color = mkLiteral "#ffffff";
        font = "JetBrainsMono Nerd Font Bold Italic 10";
        border-color = mkLiteral "#ffffff";
      };

      "element-text" = {
        text-color = mkLiteral "#ffffff";
        vertical-align = mkLiteral "0.5";
      };

      "element-icon" = {
        size = mkLiteral "1.2em";
        vertical-align = mkLiteral "0.5";
      };

      "message" = {
        padding = 8;
        text-color = mkLiteral "#ffffff";
      };
    };
  };
}
