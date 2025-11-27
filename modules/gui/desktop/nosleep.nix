{
  services.logind.lidSwitch = "ignore";

  # 2. 彻底禁用系统层面的睡眠、休眠、挂起
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  
  # 3. (可选) 防止纯文本控制台 (TTY) 熄屏
  boot.kernelParams = [ "consoleblank=0" ];
}
