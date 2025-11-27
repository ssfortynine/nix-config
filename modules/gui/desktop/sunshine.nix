{ config, pkgs, ... }:

{
  # 1. 安装 Sunshine
  environment.systemPackages = with pkgs; [
    sunshine
    pulseaudio 
    pipewire
  ];

  # 2. 开启 Sunshine 服务
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPorts = [ 47998 47999 48000 48002 48010 ];
  };


  services.sunshine = {
    enable = true;
    autoStart = true;    
    capSysAdmin = true;  
    openFirewall = true;   
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;     # 允许通过主机名解析
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };
  hardware.graphics.enable = true;
  hardware.amdgpu.initrd.enable = true;

  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';

}

