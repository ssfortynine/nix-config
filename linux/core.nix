{
  imports = [
    ../base/core/btop.nix
    ../base/core/pip.nix
    ../base/core/yazi.nix
    ../base/core/container.nix
    ../base/core/neovim.nix
    ../base/core/starship.nix
    ../base/core/zellij.nix
    # ../modules/base

    ./base/shell.nix
    ./base/tools.nix
  ];
}
