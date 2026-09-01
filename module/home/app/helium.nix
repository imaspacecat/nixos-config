{ inputs, ... }:

{
  imports = [
    inputs.helium-browser.homeModules.default
  ];

  programs.helium.enable = true;
}
