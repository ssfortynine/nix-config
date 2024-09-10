{ config, pkgs, ...}: {
  # processing audio/video
  home.packages = with pkgs; [
    ffmpeg-full

    # images
    viu # Termial image viewer with native support for iTerm and Kitty
    imagemagick
    graphviz
  ];
}
