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
    starship
    
    # gnome extension
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
  ];
}
