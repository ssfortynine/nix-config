{ pkgs, ...}: {
  home.file.".ssh/id_isa.pub".source = "/home/qiqi49/secrets/id_isa.pub";

  programs.ssh = {
    enable = true;
  };
}