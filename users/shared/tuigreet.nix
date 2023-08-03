{ config, pkgs, user, inputs, slogan ? "Pure Joy, Functions.", cmd, ... }:
{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet -g ${slogan} --cmd ${cmd} -r --remember-session --time --asterisks --power-shutdown shutdown now --power-reboot reboot
        '';
        user = user;
      };
    };
  };
}
