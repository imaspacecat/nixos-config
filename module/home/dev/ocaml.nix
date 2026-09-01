{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ocaml
    dune
    opam
    ocamlPackages.findlib
  ];
}
