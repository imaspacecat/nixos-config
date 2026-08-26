{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
  ];

  home.packages = [
    pkgs.discord-ptb
  ];
}
