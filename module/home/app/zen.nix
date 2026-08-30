{ pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    policies = {
      ExtensionSettings = {
        # AMOLED Black Theme
        "{bc16b6e3-4935-42b3-bff7-b65b49434857}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/amoled-black/latest.xpi";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        # FuzzyTabs
        "{08ed11c3-efeb-4275-8887-5b1fc9dfc183}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/terrakok-fuzzytabs/latest.xpi";
        };
      };
    };

    profiles.spacecat = {
      id = 0;
      name = "spacecat";
      isDefault = true;

      settings = {
        "zen.tab-unloader.timeout" = 10;
        "browser.tabs.unloadOnLowMemory" = true;
        "browser.tabs.fadeOutUnloadedTabs" = true;
        "zen.tab-unloader.excluded-urls" = "discord.com,youtube.com";
        "dom.ipc.processCount" = 4;
      };
    };
  };
}
