{ pkgs, inputs, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprland";
        user = "lemon";
      };
      default_session = initial_session;
    };
  };
}
