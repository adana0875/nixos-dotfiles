{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # hardware/necessary
    sbctl

    # necessary general
    git
    vim
    wget
    lm_sensors
    tree

    #============DEVELOPMENT PKGS==============
    # for podman
    podman-tui
    podman-compose
    go
    neovim

    #==============APPLICATIONS=================
    # preference
    brave
    ghostty
    starship

    # my applications
    spotify
    
    # gnome extension
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
  ];
}
