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
    neovim
    gcc
    postgresql
    starship

    #  project specific
    go
    nodePackages.npm

    # make cmds
    gnumake
    just #trying out just

    #==============APPLICATIONS=================
    # preference
    brave
    ghostty

    # my apps
    discord
    
    # gnome extension
    gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
  ];
}
