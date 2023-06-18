{ pkgs, user, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet 
          -g "Pure Joy, Functions." 
          -r --remember-session 
          --time 
          --asterisks 
          --sessions "/run/current-system/sw/share/wayland-sessions:/run/current-system/sw/share/xsessions"
          --power-shutdown shutdown now
          --power-reboot reboot
        '';
        user = user;
      };
    };
  };
}
