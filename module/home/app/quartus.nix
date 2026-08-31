{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    quartus-prime-lite
  ];
}
