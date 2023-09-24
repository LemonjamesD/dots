{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      colorscheme catppuccin "catppuccin-frappe"
    '';
    plugins = with pkgs.vimPlugins; [
      catppuccin-vim
    ];
  };
}
