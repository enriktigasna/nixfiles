{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./gdb.nix
    ./neovim
  ];

  home.username = "maxim";
  home.homeDirectory = "/home/maxim";

  home.packages = with pkgs; [
    firefox
    vscode-fhs
    git
    gitkraken
    obsidian

    cantarell-fonts
    nerdfonts
    xclip
    zellij
    gdb

    file
    unzip
    tree

    (pkgs.discord.override {
      withVencord = true;
    })
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export EDITOR=nvim
    '';

    shellAliases = {
      # TODO Aliases
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
