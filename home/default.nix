{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
	./git.nix
	./starship.nix
	./neovim.nix
  ];
  
  home.username = "maxim";
  home.homeDirectory = "/home/maxim";

  home.packages = with pkgs; [
    firefox
    vscode-fhs
    git
    gitkraken
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
    	# TODO Aliases
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
