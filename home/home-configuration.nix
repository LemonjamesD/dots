{ system, nixpkgs, home-manager, user, secrets, stateVersion, machine-settings, inputs, ... }:

let
  username = user;
  homeDirectory = "/home/${user}";
  configHome = "/etc/nixos";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.xdg.configHome = configHome;
  };

  home-nix = "/etc/nixos/home/${username}";
in
{
  "${user}" = home-manager.lib.homeManagerConfiguration {
    pkgs = pkgs;
    extraSpecialArgs = { inherit username homeDirectory secrets stateVersion inputs machine-settings; }; 
    modules = [
      machine-settings.home-settings
      inputs.nixvim.homeManagerModules.nixvim
      inputs.flatpaks.homeManagerModules.default
      home-nix
    ];
  };
}