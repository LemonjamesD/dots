{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-nvidia.url = "github:nixos/nixpkgs/nixos-23.05";
    hyprland.url = "github:hyprwm/Hyprland";
    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    fhs.url = "github:GermanBread/nixos-fhs/stable";

    # Lilex Font
    lilex-font.url = "github:LemonjamesD/Lilex-Flake/pre-compiled";

    # Impermanence
    impermanence.url = "github:nix-community/impermanence";

    # Home-manager packager
    home-manager.url = "github:nix-community/home-manager";
    # helix bs (the workaround is insane)
    dream2nix.url = "github:nix-community/dream2nix";
    nci = {
      url = "github:yusdacra/nix-cargo-integration";
      inputs.dream2nix.follows = "dream2nix";
    };
    helix-master = {
      url = "github:LemonjamesD/helix/new-daily-driver";
      inputs.nci.follows = "nci";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-contrib.url = "github:hyprwm/contrib";
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
  };

  outputs = {
    self, nixpkgs, hyprland, xdg-desktop-portal-hyprland, home-manager, helix-master, hypr-contrib, flatpaks, fhs, lilex-font, impermanence, nixpkgs-nvidia, ... 
  }@inputs: let
    secrets = import "/etc/nixos/secrets.nix";
    machine-settings = import ./settings/machine-settings.nix;

    mkNixOS = nixpkgs.lib.nixosSystem {
      inherit (machine-settings.system);
      specialArgs = { inherit nixpkgs machine-settings secrets inputs; };
      modules = [ 
        # Add FHS environment
        inputs.fhs.nixosModules.default
        "${inputs.impermanence}/nixos.nix"
        # System
        (./configuration.nix)
        (./machines + "/${machine-settings.host}/hardware.nix")
        # User
        (./users + "/${machine-settings.user}/default.nix")
      ];
    };
  in {
    homeConfigurations = import ./home/home-configuration.nix { 
      inherit home-manager nixpkgs machine-settings secrets inputs; 
    };

    nixosConfigurations = {
      "${machine-settings.host}" = mkNixOS;
      "nixos" = mkNixOS;
    };
  };
}