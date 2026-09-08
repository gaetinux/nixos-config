{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    historyControl = [
      "ignoredups"
      "ignorespace"
    ];

    historySize = 10000;
    historyFileSize = 20000;

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
  ];
}