{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.llm-agents.packages.${pkgs.system}.codex
  ];
}
