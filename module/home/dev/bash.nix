{ pkgs, lib, ... }:

let
  cpd-script = pkgs.writeShellScriptBin "cpd" ''
    export PATH="${
      lib.makeBinPath [
        pkgs.xclip
        pkgs.coreutils
        pkgs.findutils
      ]
    }:$PATH"
    ${builtins.readFile ../script/cpd}
  '';
in
{
  home.packages = [ cpd-script ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake .#loaner";
      screenshot = "maim -s | xclip -selection clipboard -t image/png";
      fv = "vim \$(fzf)";
      cpd = "cpd";
      cb = "xclip -sel clipboard";
    };
  };
}
