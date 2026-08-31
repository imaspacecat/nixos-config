{ ... }:

{
  users.users.spacecat = {
    isNormalUser = true;
    description = "Yotam Dubiner";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "usb-blaster"
    ];
  };

  home-manager.backupFileExtension = "backup";
}
