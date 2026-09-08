{ ... }:

{
  programs.git = {
    enable = true;

    userName = "Gaetan Pawlowski";
    userEmail = "gaetan@gaetinux.com";

    extraConfig = {
      init.defaultBranch = "main";

      pull.rebase = false;

      push.autoSetupRemote = true;
    };
  };
}