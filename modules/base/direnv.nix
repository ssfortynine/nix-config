{ pkgs, ... }: {
  # Direnv, load and unload environment variables depending on the current directory.
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
