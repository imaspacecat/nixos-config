{ config, lib, ... }:

{
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ config.sops.secrets."networks".path ];

    profiles = {
      illinoisnet = {
        connection = {
          id = "IllinoisNet";
          type = "wifi";
          autoconnect = "true";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "IllinoisNet";
        };
        wifi-security = {
          key-mgmt = "wpa-eap";
        };
        "802-1x" = {
          eap = "$net2_eap";
          phase2-auth = "$net2_phase2_auth";
          identity = "$net2_identity";
          password = "$net2_password";
        };
        ipv4 = {
          method = "auto";
          dns = "1.1.1.1;1.0.0.1;";
          ignore-auto-dns = "true";
        };
      };
    };
  };

  systemd.services."NetworkManager-ensure-profiles" = {
    after = [ "sops-nix.service" ];
    wants = [ "sops-nix.service" ];
  };
}
