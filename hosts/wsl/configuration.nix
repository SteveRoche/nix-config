{
  config,
  lib,
  pkgs,
  ...
}: {
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  system.stateVersion = "24.05";
  users.defaultUserShell = pkgs.zsh;
}
