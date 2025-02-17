{
  config,
  pkgs,
  ...
}: {
  home.username = "maxim";
  home.homeDirectory = "/home/maxim";

  home.packages = with pkgs; [
    neovim
    firefox
    vscode-fhs
    git
    gitkraken
  ];

  programs.git = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  programs.zsh.enable = true;

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
