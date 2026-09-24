{ inputs, ... }:

{
  # Status line script, pinned through the claude-statusline flake input.
  # ~/.claude/settings.json stays outside Home Manager: Claude Code writes to
  # it (plugins, model, permissions), so it must not become a read-only link.
  home.file.".claude/statusline-command.sh" = {
    source = "${inputs.claude-statusline}/statusline-command.sh";
    executable = true;
  };
}
