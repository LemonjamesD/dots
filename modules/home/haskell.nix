{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haskellPackages.ghc_9_6_1
    haskellPackages.Cabal_3_8_1_0
  ];
}
