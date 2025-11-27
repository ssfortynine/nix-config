{ pkgs, ...}: {
  home.packages = with pkgs; [
    v2raya # proxy tool
    clash-verge-rev
    insomnia # REST client
    wireshark # network analyzer
    putty # A free ssh/teinet client
    remmina # Remote desktop client
    # todesk

    tigervnc
    xorg.xinit
    icewm
    dbus
    x11vnc

    # Automatically trims your branches whose tracking remote refs are merged or gone
    # It's really useful when you work on a project for a long time.
    git-trim
    gitleaks

    # need to run `conda-install` before using it
    # need to run `conda-shell` before using command `conda`
    # conda is not available for MacOS
    conda 

    # 
    gnome-multi-writer
  ];
}
