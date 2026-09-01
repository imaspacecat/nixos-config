{ ... }:

let
  extensionSettings = {
    "{bc16b6e3-4935-42b3-bff7-b65b49434857}" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/amoled-black/latest.xpi";
    };
    "uBlock0@raymondhill.net" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    };
    "{08ed11c3-efeb-4275-8887-5b1fc9dfc183}" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/terrakok-fuzzytabs/latest.xpi";
    };
  };
in
{
  programs.firefox.policies.ExtensionSettings = extensionSettings;
  programs.zen-browser.policies.ExtensionSettings = extensionSettings;
}
