{ lib, pkgs, ...}: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";

    font = {
      name = "JetBrainsMono";
      size = 
        if pkgs.stdenv.isDarwin
	then 11
	else 10;
    };

    settings = {
      background_opacity = "0.93";
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
    };
    darwinLaunchOptions = ["--start-as=maximized"];
  };
}
