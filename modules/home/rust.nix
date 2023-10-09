{ pkgs, inputs, machine-settings, ... }: let
  toolchain = with inputs.fenix.packages.${machine-settings.system}; combine [
    latest.cargo
    latest.rustc
    targets."x86_64-unknown-linux-gnu".latest.rust-std
    latest.rust-docs
  ];
in {
  nixpkgs.overlays = [
    (_: super: let pkgs = inputs.fenix.inputs.nixpkgs.legacyPackages.${super.system}; in inputs.fenix.overlays.default pkgs pkgs)
  ];
  
  home.packages = with pkgs; [
    gcc
    cargo-expand
    glibc_multi
    rust-analyzer-nightly
    toolchain
    rusty-man
  ];
}
