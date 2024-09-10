{ pkgs, ... }: {
  # Enable starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';

    # Set aliases
    shellAliases = {
      lg = "lazygit";
      gv = "git remote -v";
      la = "ls -a";
      proxy = "sudo sh /home/qiqi49/proxy.sh";
    };

    syntaxHighlighting.enable = true;
    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };
  };
}
