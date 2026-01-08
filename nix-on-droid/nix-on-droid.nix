{ config, lib, pkgs, fetchurl, ... }:
let
  phpactor = pkgs.callPackage ./phpactor.nix {};
  pkgs' = pkgs // { inherit phpactor; };
in
{
  environment.packages = with pkgs'; [
    direnv
    git
    man
    ncurses
    neovim
    phpactor
    which
  ];

  system.stateVersion = "24.05";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  time.timeZone = "America/Fortaleza";
  environment = {
    motd = null;
    etcBackupExtension = ".bak";
    sessionVariables = {
      XDG_CONFIG_HOME = ~/.config;
      EDITOR = "nvim";
    };
  };
	# FIXME(SwagSilver): i'll get this to use fetchurl once it works on my end
  terminal.font = ./ComicMono.ttf;
}
