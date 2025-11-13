{
  config,
  pkgs,
  lib,
  nur-ryan4yin,
  nur-xddxdd,
  tg-searcher,
  kickstart-nixvim,
  nixvim-config,
  ...
}:
{
  home.username = "qiqi49";
  home.homeDirectory = lib.mkForce "/home/qiqi49";
  # Link the configuration file in the current folder directly
  # to the specified location in the Home directory
  #home.file.".config/i3/wallpaper.jpg".source = /home/qiqi49/Pictures/ranni.jpeg;

  # Recursively links files in a folder to a specified location in the Home directory
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts; recursive = true; # recursive the hotal directory
  #   executable = true; # add [execute] permissions to all files
  # };

  # Hard-code the contents of the file directory in the nix configuration file as text
  # home.file.".xxx".text = ''
  #   xxx
  # '';

  # Setting the mouse pointer size and font DPI(for 2k monitors)
  xresources.properties = {
    "Xcursor.size" = lib.mkForce 16;
    "Xft.dpi" = lib.mkForce 228;
  };

  # Install some common software via home.packages
  # The software will only be available to the current user and will not affect the system level configuration
  # It is recommanded that all GUI software, as well as CLI software that has little to do with OS,
  # be installed via home.packages
  home.packages = with pkgs; [
    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directions for a regax pattern
    jq # A lightweight and flexible commmand-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for 'ls'
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # 'dig' + 'nslookup'
    ldns # replacement of 'dig', it provide the command 'drill'
    aria2 # Alightweight multi-protocol
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command 'nom' works just like 'nix'
    # with more details lgo output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in termial

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system tools
    sysstat
    lm_sensors # for 'sensors' command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    gnome-tweaks

    # shell tools
    zsh
    kitty

    # utils app
    vscode
    feishu
    zotero_7
    google-chrome

    wemeet
    baidupcs-go
    wpsoffice
    #neve.packages.${pkgs.system}.default
    #kickstart-nixvim.packages.${pkgs.system}.default
    nixvim-config.packages.${pkgs.system}.default
    jetbrains.idea-community
    hexo-cli
    linuxKernel.packages.linux_6_6_hardened.v4l2loopback
    linuxKernel.packages.linux_6_6_hardened.virtualbox
    virtualbox
    texmaker
    texliveFull
  ];

  imports = [
    ./modules/base.nix
    ./modules/gui.nix
    ./modules/tui.nix
  ];

  home.stateVersion = "25.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
