{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haskell.compiler.ghcHEAD
    haskellPackages.cabal-install
  ];
}
