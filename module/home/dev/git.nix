{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Yotam Dubiner";
        email = "yotam@dubiner.org";
      };
    };
  };
}
