# nixos/programs.nix

{ config, pkgs, ... }:

let
  aliases = {
    ll = "ls -l";
    la = "ls -a";
    lt = "ls --tree";
    ".." = "cd ..";
    rmd = "rm -rd";
    mkd = "mkdir";
    mkp = "mkdir -p";
  };
  zshInit = ''
      if [ "$(whoami)" != "andrew" ] && [ "$(whoami)" != "root" ]
        exce su - andrew
      fi
  '';
in {
  programs = {
    bash = {
      shellAliases = aliases;
      shellInit = zshInit;
      completion = {
        enable = true;
        package = pkgs.bash-completion;
      };
    };

    zsh = {
      enable = true;
      shellAliases = aliases;
      shellInit = zshInit;
      enableCompletion = true;
    };

    git = {
      enable = true;
      config.init.defaultBranch = "main";
    };
  };
}
