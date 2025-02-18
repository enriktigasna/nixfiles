{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>pv";
        action = "<cmd>Oil<CR>";
        options = {
          desc = "Open oil.nvim";
        };
      }
    ];
  };
}
