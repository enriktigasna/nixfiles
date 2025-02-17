{ inputs, pkgs, ... }:
{
  imports = [ inputs.mnw.nixosModules.default ];

  programs.mnw = {
    enable = true;

    neovim = pkgs.neovim-unwrapped;
    withPython3 = true;
    viAlias = false;
    vimAlias = false;

    plugins = [
      # ./nvim
      pkgs.vimPlugins.oil-nvim
    ];


  };
}
