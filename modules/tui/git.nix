{ pkgs, ... }: {
  # Setup git
  programs.git = {
    enable = true;
    userName = "ssfortynine";
    userEmail = "ssfortynine@gmail.com";
  };
  # Enable lazygit
  programs.lazygit.enable = true;
}
