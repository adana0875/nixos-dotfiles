{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # hardware/necessary
    sbctl

    # necessary general
    git
    vim
    neovim
    wget
    lm_sensors

    # preference
    brave
    ghostty
    vscodium
  ];
}
