{
  pkgs,
  nur-ryan4yin,
  ...
}: {
  home.packages = with pkgs; [
    # creative
    blender # 3d modeling
    inkscape # vector graphics
    krita # digital painting
    musescore # music notation

    drawio # creating diagrams

    # WaveDrom command-line interface 
    nodePackages_latest.wavedrom-cli 

    # fpga
    #pkgs.python312Packages.apycula # gowin fpga
    pkgs.yosys # fpga synthesis
    pkgs.nextpnr # fpga place and route
    pkgs.openfpgaloader # fpga programming

    # layout
    xdot
    #nur-ryan4yin.packages.${pkgs.system}.gowin-eda-edu-ide # app: `gowin-env` => `gw_ide` / `gw_pack` / ...
  ];

  programs = {
    # live streaming
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        #screen capture
        wlrobs
        # obs-ndi
        obs-vaapi
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
