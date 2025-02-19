{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./telescope.nix
    ./keymaps.nix
    ./cmp.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      timeout = true;
      timeoutlen = 300;
      smarttab = true;
      foldenable = true;
      foldcolumn = "1";
      fillchars = {
        eob = " ";
        fold = " ";
        foldopen = "";
        foldsep = " ";
        foldclose = "";
      };
      foldlevel = 99;
      foldlevelstart = 99;
      tabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      cindent = true;
      smartindent = true;
      smartcase = true;
      ignorecase = true;
      infercase = true;
      showmode = false;
      ruler = false;
      showcmd = false;
      breakindent = true;
      copyindent = true;
      cursorline = true;
      expandtab = true;
      preserveindent = true;
      pumheight = 10;
      undofile = true;
      virtualedit = "block";
      wrap = false;
      titlestring = "neovim";
      title = true;
      splitbelow = true;
      splitright = true;
    };
    colorschemes.oxocarbon.enable = true;

    plugins = {
      lualine.enable = true;
      oil = {
        enable = true;
      };
    };
  };
}
