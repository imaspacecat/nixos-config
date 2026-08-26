{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake ~/nixos/#nixos";
      cpdir = "nix-shell -p xclip --run \"find . -maxdepth 1 -type f -exec tail -n +1 {} + | xclip -selection clipboard\"";
      screenshot = "maim -s | xclip -selection clipboard -t image/png";
      fv = "vim \$(fzf)";
    };
  };
}
