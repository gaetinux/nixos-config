{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Gaetan Pawlowski";
        email = "gaetan@gaetinux.com";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };
}