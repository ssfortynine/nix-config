{ pkgs, ...}: {
  home.packages = with pkgs; [
    v2raya # proxy tool
    insomnia # REST client
    wireshark # network analyzer

    # IDEs
    jetbrains.idea-community
  ];
}
