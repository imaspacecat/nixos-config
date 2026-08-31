{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          ms-python.vscode-pylance
          ms-python.python
          ms-python.debugpy
          ritwickdey.liveserver
          mshr-h.veriloghdl
        ])
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "tabout";
            publisher = "albert";
            version = "0.2.2";
            sha256 = "sha256-s306AHMkUFPaG7ISIr0RscK/k6OVtniIG1CQprBx+cY=";
          }
        ];

      userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "nix.formatterPath" = "${pkgs.nixfmt}/bin/nixfmt";
        "editor.formatOnSave" = true;
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
      };
    };
  };
}
