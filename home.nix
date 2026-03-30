{ config, pkgs, ...}:

{
  home.username = "andrew";
  home.homeDirectory = "/home/andrew";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo Home Manager working";
    };
  };
}
