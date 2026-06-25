{ ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks."github.com" = {
      user = "git";                       # GitHub's fixed username — same for everyone
      identityFile = "~/.ssh/id_ed25519"; # ← a PATH string, NOT key contents
      identitiesOnly = true;              # offer ONLY this key, don't spray others
    };
  };
}
