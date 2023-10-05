{ config, pkgs, user, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet -g \"Pure Joy, Functions\" -c Hyprland -r --remember-session --time --asterisks --power-shutdown shutdown now --power-reboot reboot
        '';
        user = user;
      };
    };
  };
}
