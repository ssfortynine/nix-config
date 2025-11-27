{ pkgs, ... }:{
  networking.firewall.allowedTCPPorts=[ 5900 5901 5902 4000 9200];

  systemd.services.myserver-vnc = {
    description = "VNC Server for User qiqi49";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      User = "qiqi49";
      PAMname = "login";
      Type = "simple";

      ExecStart = let
        startScript = pkgs.writeShellScript "vnc-start-script" ''
          #!/bin/sh
          export PATH=$PATH:/run/current-system/sw/bin
          unset DBUS_SESSION_BUS_ADDRESS
          unset SESSION_MANAGE
          unset WAYLAND_DISPLAY
          export MOZ_ENABLE_WAYLAND=0
          export GDK_BACKEND=x11
          export QT_QPA_PLATFORM=xcb
          if [ -x "$(command -v dbus-launch)" ]; then
            eval "$(dbus-launch --sh-syntax --exit-with-session)"
          fi
          ${pkgs.icewm}/bin/icewm-session
        '';
        in "${pkgs.xorg.xinit}/bin/xinit ${startScript} -- ${pkgs.tigervnc}/bin/Xvnc :2 -rfbauth /home/qiqi49/.vnc/passwd -geometry 2360x1640 -depth 24";
    };
  };
}
