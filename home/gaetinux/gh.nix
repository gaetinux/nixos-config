{ ... }:

{
  programs.gh = {
    enable = true;

    settings = {
      # Match the SSH remotes this account uses.
      git_protocol = "ssh";
    };

    # gitCredentialHelper is enabled by default and writes the git credential
    # entries for github.com and gist.github.com. It is what lets `gh` act as
    # the credential provider over HTTPS, which `gh auth login` cannot set up
    # itself here: Home Manager owns ~/.config/git/config as a read-only link.
  };
}
