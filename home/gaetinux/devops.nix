{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    kubectl
    kubernetes-helm
    k9s
  ];
}
