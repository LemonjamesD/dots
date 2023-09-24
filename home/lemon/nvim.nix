{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      colorscheme catppuccin "catppuccin-frappe"
    '';
    plugins = with pkgs.vimPlugins; [
      catppuccin-vim
    ];
  };
}
