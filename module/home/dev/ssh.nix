{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        Hostname = "github.com";
        IdentityFile = "~/.ssh/git_id_ed25519";
        IdentitiesOnly = "yes";
      };
    };
  };
}
