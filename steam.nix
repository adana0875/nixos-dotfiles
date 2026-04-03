{pkgs, ...}: 
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # steam/gaming specific pkgs
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
  ];

  # run protonup
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/andrew/.steam/root/compatibilitytools.d";
  };

}