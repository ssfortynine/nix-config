{ pkgs, ...}: {
  home.packages = with pkgs; [
    # misc
    libnotify

    ventoy # create bootable usb
    virt-viewer # vnc connect to VM, used by kubevirt
  ];

  # auto mount usb drives
  services = {
    udiskie.enable = true;
    # syncthing.enable = true;
  };
}
