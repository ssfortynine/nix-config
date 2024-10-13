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
      
      # ccache
      export USE_CCACHE=1
      export CCACHE_SLOPPINESS=file_macro,include_file_mtime,time_macros
      export CCACHE_UMASK=002
      export CCACHE_DIR="/home/qiqi49/.ccache"
      export CC="ccache gcc"
      export CXX="ccache g++"
      export PATH=/usr/lib/ccache:$PATH

      # ysyx-workbench
      export NEMU_HOME=/home/qiqi49/ysyx-workbench/nemu
      export AM_HOME=/home/qiqi49/ysyx-workbench/abstract-machine
      export NPC_HOME=/home/qiqi49/ysyx-workbench/npc

      # verilator
      # export VERILATOR_ROOT=/home/qiqi49/verilator
      # unset VERILATOR_ROOT
      export VERILATOR_AUTHOR_SITE=1
      export NVBOARD_HOME=/home/qiqi49/ysyx-workbench/nvboard

    '';

    # Set aliases
    shellAliases = {
      # git
      lg = "lazygit";
      gv = "git remote -v";

      # ls
      la = "ls -a";
      mkdir = "mkdir -p";
      df = "df -h";

      # proxy
      proxy = "sudo sh /home/qiqi49/proxy.sh";
      # nvim = "nix run /home/qiqi49/nixvim";
      
    };

    syntaxHighlighting.enable = true;
    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };
  };
}
