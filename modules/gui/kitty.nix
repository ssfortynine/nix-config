{ lib, pkgs, ...}: {
  programs.kitty = {
    enable = true;   themeFile = "Catppuccin-Mocha";

    font = {
      name = "JetBrainsMono";
      size = 
        if pkgs.stdenv.isDarwin
	      then 14
      	else 13;
    };

    settings = {
      background_opacity = "0.93";
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
    };
    darwinLaunchOptions = ["--start-as=maximized"];
  };
}
