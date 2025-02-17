{ inputs, pkgs, ... }:
{
  programs.mnw = {
    enable = true;
    /*
    initLua = ''
      require("myconfig")
    '';
    */
    plugins = [
      #./nvim
      pkgs.vimPlugins.oil-nvim
    ];
  };
}
