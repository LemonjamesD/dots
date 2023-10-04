{ system, nixpkgs, home-manager, user, secrets, stateVersion, inputs, ... }:

let
  username = user;
  homeDirectory = "/home/${user}";
  configHome = "/etc/nixos";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.xdg.configHome = configHome;
  };

  home-nix = (../home + "/${username}");
in
{
  "${username}" = home-manager.lib.homeManagerConfiguration {
    pkgs = pkgs;
    extraSpecialArgs = { inherit username homeDirectory secrets stateVersion inputs; }; 
    modules = [
      # ({ pkgs, ... }: {
      #   nixpkgs.overlays = [ inputs.fenix.overlays.default ];
      # })
      inputs.nixvim.homeManagerModules.nixvim
      inputs.flatpaks.homeManagerModules.default
      home-nix
    ];
  };
}