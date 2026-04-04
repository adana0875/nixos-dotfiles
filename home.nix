{ config, pkgs, inputs, ...}:

let
  dotfiles = "${config.home.homeDirectory}/git/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  # using Neuwaita Icon Pack
  neuwaita_path = pkgs.stdenv.mkDerivation {
    name = "Neuwaita";
    src = builtins.fetchGit { 
      url = "https://github.com/RusticBard/Neuwaita.git"; 
    };

    nativeBuildInputs = [ pkgs.gtk3 ];

    installPhase = ''
      mkdir -p $out/share/icons
      mkdir -p $out/share/icons/Neuwaita
      rm -rf Extras
      rm -rf img
      cp -r * $out/share/icons/Neuwaita
      gtk-update-icon-cache --force $out/share/icons/Neuwaita
    '';
  };
in

{

  imports = [
    inputs.spicetify-nix.homeManagerModules.default  # <-- this must be here
    # ./starship.nix
  ];
  home = {
    username = "andrew";
    homeDirectory = "/home/andrew";
    packages = [ ];
  };

  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    initExtra = "eval \"$(starship init bash)\"";
  };

  xdg.configFile."ghostty" = {
    source = create_symlink "${dotfiles}/ghostty/";
    recursive = true;
  };
  xdg.configFile."VSCodium" = {
    source = create_symlink "${dotfiles}/vscode/";
    recursive = true;
  };

  xdg.configFile."MangoHud" = {
    source = create_symlink "${dotfiles}/MangoHud/";
    recursive = true;
  };

  xdg.configFile."starship.toml".source = create_symlink "${dotfiles}/starship.toml";


  gtk.iconTheme = {
    name = "Neuwaita";
    package = neuwaita_path;
  };

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
  };
}
