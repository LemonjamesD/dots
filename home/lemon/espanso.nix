{ config, lib, pkgs, ... }:

{
  services.espanso = {
    enable = true;
    configs = {
      default = {
        show_notifications = false;
        keyboard_layout = {
          layout = "us";
          variant = "dvp";
        };
      };
    };
    matches = {
      base = {
        matches = [
          {
            trigger = ":piss:";
            replace = "I'm gonna brown";
          }
          {
            regex = '':calc\s(?P<term>.*):'';
            replace = "{{result}}";
            vars = [
              {
                name = "result";
                type = "shell";
                params = {
                  cmd = ''echo $ESPANSO_TERM | qalc -t'';
                  shell = "zsh";
                };
              }
            ];
          }
        ];
      };
    };
  };
}
