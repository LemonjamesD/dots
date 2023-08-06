{ config, lib, pkgs, ... }:

{
  home.file.".config/espanso/match/base.yml".text = ''
matches:
  - regex: ':bl\s?(?P<lang>.*):'
    replace: "```{{lang}}\n$|$\n```"
  # Struct
  - regex: ':sn(?P<space>\s?)(?P<vis>(pub|pub\(crate\))?)\s(?P<ident>.+):' # Normal
    replace: "{{vis}}{{space}}struct {{ident}} {\n    $|$\n}"
  - regex: ':st(?P<space>\s?)(?P<vis>(pub|pub\(crate\))?)\s(?P<ident>.+):' # Tuple
    replace: "{{vis}}{{space}}struct {{ident}}($|$);"
  - regex: ':su(?P<space>\s?)(?P<vis>(pub|pub\(crate\))?)\s(?P<ident>.+):' # Unit
    replace: "{{vis}}{{space}}struct {{ident}};"
  # Enum
  - regex: ':en(?P<space>\s?)(?P<vis>(pub|pub\(crate\))?)\s(?P<ident>.+):'
    replace: "{{vis}}{{space}}enum {{ident}} {\n    $|$\n}"
  # Enum
  - regex: ':fn(?P<space>\s?)(?P<vis>(pub|pub\(crate\))?)\s(?P<ident>[a-z_]*)(?P<return>(\s->\s.+)?):'
    replace: "{{vis}}{{space}}fn {{ident}}($|$){{return}} {\n    \n}"
  # Accents
  - trigger: ':"o'
    replace: ö
  - trigger: ':"a'
    replace: ä
  - regex: ':(o|O)a'
    replace: å
  - trigger: ':"O'
    replace: Ö
  - trigger: ':"A'
    replace: Ä
  - regex: ':(o|O)A'
    replace: Å
  '';

  services.espanso = {
    enable = true;
    configs = {
      default = {
        show_notifications = false;
        keyboard_layout = {
          layout = "dvorak";
        };
      };
    };
  };
}
