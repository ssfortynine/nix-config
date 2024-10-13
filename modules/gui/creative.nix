{
  pkgs,
  nur-ryan4yin,
  ...
}: {
  home.packages = with pkgs; [
    # creative
    blender # 3d modeling
    # gimp      # image editing, I prefer using figma in browser instead of this one
    inkscape # vector graphics
    krita # digital painting
    musescore # music notation
    # reaper # audio production
    # sonic-pi # music programming

    drawio # creating diagrams

    # WaveDrom command-line interface 
    nodePackages_latest.wavedrom-cli 

    # fpga
    #pkgs.python312Packages.apycula # gowin fpga
    pkgs.yosys # fpga synthesis
    pkgs.nextpnr # fpga place and route
    pkgs.openfpgaloader # fpga programming
    #nur-ryan4yin.packages.${pkgs.system}.gowin-eda-edu-ide # app: `gowin-env` => `gw_ide` / `gw_pack` / ...
  ];

  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        # screen capture
        wlrobs
        # obs-ndi
        obs-vaapi
        obs-nvfbc
        obs-teleport
        # obs-hyperion
        droidcam-obs
        obs-vkcapture
        obs-gstreamer
        obs-3d-effect
        input-overlay
        obs-multi-rtmp
        obs-source-clone
        obs-shaderfilter
        obs-source-record
        obs-livesplit-one
        looking-glass-obs
        obs-vintage-filter
        obs-command-source
        obs-move-transition
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
