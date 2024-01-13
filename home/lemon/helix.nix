{ config, pkgs, inputs, ... }: 
{
  programs.helix = {
    enable = true;
    package = inputs.helix-master.packages."x86_64-linux".default;
    settings = {
      theme = "catppuccin_frappe";
      # icons = "nerdfonts";
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
          # mode-separator = "";
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
        rulers = [80 120];
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          file-types = ["oak" "rs"]; # this is for oak lang which doesn't have it's own highlighting but looks like rust
        }
        {
          name = "c";
          file-types = ["c" "h" "cpp" "hpp"];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "cobol";
          file-types = ["cob"];
          scope = "main.cob";
          comment-token = "*";
          roots = ["main.cob"];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          rulers = [7 12 72];
        }
      ];
      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };
    };
  };
}
