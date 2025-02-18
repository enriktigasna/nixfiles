{
  inputs,
    pkgs,
    ...
}: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
        };
        
        nil_ls.enable = true;
        pyright.enable = true;
      };
    };
  };
}
