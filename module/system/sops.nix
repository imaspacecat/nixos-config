{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sops
    age
  ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;

    age.keyFile = "/home/spacecat/.config/sops/age/keys.txt";

    secrets."networks" = {
      owner = "root";
      group = "root";
    };
  };
}
