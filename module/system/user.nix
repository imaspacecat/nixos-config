{ ... }:

{
  users.users.spacecat = {
    isNormalUser = true;
    description = "Yotam Dubiner";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };

  home-manager.backupFileExtension = "backup";
}
