{ config, pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-gtk # alternatively, kdePackages.fcitx5-qt
      fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
      fcitx5-rime
    ];
  };
}

