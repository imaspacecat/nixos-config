{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.codex
  ];
}
