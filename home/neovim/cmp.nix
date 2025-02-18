{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    cmp = {
      enable =
        true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select
      = true })";
          "<Esc>" = "cmp.mapping.abort()";
        };
        sources = [{name = "nvim_lsp";} {name = "path";} {name = "buffer";} {name = "luasnip";}];
      };
    };
  };
}
