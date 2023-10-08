{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    (_: super: let pkgs = inputs.fenix.inputs.nixpkgs.legacyPackages.${super.system}; in inputs.fenix.overlays.default pkgs pkgs)
  ];
  
  home.packages = with pkgs; [
    cargo-expand
    glibc_multi
    rust-analyzer-nightly
    rustup`
  ];
}
