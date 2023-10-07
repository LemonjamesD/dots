{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # for rust-analyzer
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    fhs.url = "github:GermanBread/nixos-fhs/stable";

    # Lilex Font
#    lilex-font.url = "github:LemonjamesD/Lilex-Flake/pre-compiled";

    # Impermanence
    impermanence.url = "github:nix-community/impermanence";

    # Home-manager packager
    home-manager.url = "github:nix-community/home-manager";
    # helix bs (the workaround is insane)
    # dream2nix.url = "github:nix-community/dream2nix";
 #   nci = {
    #  url = "github:yusdacra/nix-cargo-integration";
      # inputs.dream2nix.follows = "dream2nix";
  #  };
    helix-master = {
      url = "github:LemonjamesD/helix/new-daily-driver";
      # inputs.nci.follows = "nci";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-contrib.url = "github:hyprwm/contrib";
    flatpaks.url = "github:GermanBread/declarative-flatpak?rev=fb31283f55f06b489f2baf920201e8eb73c9a0d3";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self, nixpkgs, hyprland, xdg-desktop-portal-hyprland, home-manager, helix-master, hypr-contrib, flatpaks, fhs, impermanence, nixvim, fenix, ... 
  }@inputs: let
    secrets = import "/etc/nixos/secrets.nix";
    machine-settings = import ./settings/machine-settings.nix;

    system = machine-settings.system;
    host = machine-settings.host;
    user = machine-settings.user;
    stateVersion = machine-settings.stateVersion;
    
    mkNixOS = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit nixpkgs system stateVersion machine-settings host user secrets inputs; };
      modules = [
        machine-settings.system-settings
        inputs.fhs.nixosModules.default
        "${inputs.impermanence}/nixos.nix"
        # System
        (./configuration.nix)
        (./machines + "/${machine-settings.host}/hardware.nix")
        # User
        (./system + "/${machine-settings.user}/default.nix")
      ];
    };

  in {
  
    homeConfigurations = import ./home/home-configuration.nix { 
      inherit home-manager nixpkgs machine-settings secrets inputs host user system stateVersion; 
    };

    nixosConfigurations = {
      "${machine-settings.host}" = mkNixOS;
      "nixos" = mkNixOS;
    };
  };
}
