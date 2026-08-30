{ config, pkgs, ... }:

{
  imports = [
    ./system/audio.nix
    ./system/libinput.nix
    ./system/network.nix
    ./system/sops.nix
    ./system/user.nix
  ];

  home-manager.users.spacecat = {
    imports = [
      ../home.nix

      ./home/app/alacritty.nix
      ./home/app/firefox.nix
      ./home/app/obsidian.nix
      ./home/app/zen.nix

      ./home/desktop/dunst.nix
      ./home/desktop/i3.nix
      ./home/desktop/picom.nix
      ./home/desktop/polybar.nix

      ./home/dev/bash.nix
      ./home/dev/fzf.nix
      ./home/dev/git.nix
      ./home/dev/ocaml.nix
      ./home/dev/python.nix
      ./home/dev/ssh.nix
      ./home/dev/vscode.nix
    ];
  };
}
