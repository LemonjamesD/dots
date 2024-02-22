{ ... }:

{
  # For obsidian package
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
