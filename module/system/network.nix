{ config, ... }:

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

      apartment = {
        connection = {
          id = "Wi-Fi connection 1";
          uuid = "7fe9defb-745a-40a6-ab7a-123df5bd1caa";
          type = "wifi";
          autoconnect = "true";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "508CLRK-U411";
        };
        ipv6 = {
          method = "disabled";
        };
      };
    };
  };

  systemd.services."NetworkManager-ensure-profiles" = {
    after = [ "sops-nix.service" ];
    wants = [ "sops-nix.service" ];
  };
}
