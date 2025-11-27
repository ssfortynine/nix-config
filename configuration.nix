# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/base/pipewire.nix
      ./modules/gui/desktop/zerotier.nix
      ./modules/gui/desktop/tailscale.nix
      ./modules/gui/desktop/vnc.nix
      ./modules/gui/desktop/sunshine.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.v2raya.enable = true;

  # do not need to keep too much generations
  boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimise storage 
  # you can also optimse the store manually via
  # nix-store -optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.sessionCommands = ''
      ${pkgs.xorg.xauth}/bin/xauth generate $DISPLAY . trusted
    '';
  };

  services.xserver.displayManager.gdm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "qiqi49";
  services.gnome.gnome-remote-desktop.enable = true;
  

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.qiqi49 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" "video" ];
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    curl
    lsof
    nethogs
    htop
    fastfetch
    rsync
    firefox
    v2raya
    zsh
  ];

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
};

  security.polkit.enable = true;
  environment.variables.EDITOR = "vim";

  # Setting nix-channel configuration
  nix.settings.substituters = [ 
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
    ];
  nix.settings.trusted-public-keys = [
      # the default public key of cache.nixos.org, it's built-in, no need to add it here
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];

  # Setting ZSH as the default user shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # To install qq...
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "wechat-uos"
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    glib
    openssl
    gtk3
    libGL
  ];
  # Enable Flatpak
  services.flatpak.enable = true;

  #Enable virtualbox
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "qiqi49" ];
   # virtualbox exts (for use with usb)
   # forgive me
   virtualisation.virtualbox.host.enableExtensionPack = true;
   virtualisation.virtualbox.host.enableHardening = false;

  system.stateVersion = "25.05"; # Did you read the comment?

}

