# nixos/programs.nix

{ config, pkgs, ... }:

let
  aliases = {
    ll = "ls -l";
  };
in {
  programs = {
    bash = {
      shellAliases = aliases;
      completion = {
        enable = true;
        package = pkgs.bash-completion;
      };
    };

    zsh = {
      enable = true;
      shellAliases = aliases;
      enableCompletion = true;
    };
  };
}
