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

    git = {
      enable = true;
      userName = "Andrew Ross-Sermons";
      userEmail = "aross-sermons@proton.me";
      config.init.defaultBranch = "main";
    };
  };
}
