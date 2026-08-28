{ config, pkgs, ... }:

{
  programs.obsidian = {
    enable = true;

    vaults = {
      "Personal" = {
        target = "Documents/Obsidian/Personal";
      };
    };
  };
}
