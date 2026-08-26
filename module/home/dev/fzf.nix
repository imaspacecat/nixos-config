{ pkgs, ... }:

{
  home.packages = [ pkgs.bat ];

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    historyWidgetOptions = [
      "--preview-window=hidden"
    ];
  };
}
