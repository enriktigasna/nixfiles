{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
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
