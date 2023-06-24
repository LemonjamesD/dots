{ config, pkgs, inputs, ... }: 
{
  programs.helix = {
    enable = true;
    package = inputs.helix-master.packages."x86_64-linux".default;
    settings = {
      theme = "ayu_mirage";
      icons = "nerdfonts";
      editor = {
        line-number = "relative";
        color-modes = true;
        true-color = true;
        rainbow-brackets = true;
        soft-wrap.enable = true;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        whitespace.render = "all";
        whitespace.characters = {
          space = " ";
          nbsp = "⍽";
          tab = "→";
          newline = "↲";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        gutters = [ "diagnostics" "line-numbers" "spacer" "diff"];
        statusline = {
          mode-separator = "";
          separator = "";
          left = [ "mode" "selections" "spinner" "file-name" "total-line-numbers"];
          center = [ ];
          right = [ "diagnostics" "file-encoding" "file-line-ending" "file-type" "position-percentage" "position" ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };
      };
    };
  };
}
