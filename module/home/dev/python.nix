{ pkgs, ... }:

{
  home.packages = with pkgs; [
    uv
    python312
    ruff
    libnotify
  ];
}
