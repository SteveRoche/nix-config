{pkgs, ...}: {
  imports = [../../common/home.nix];

  home.username = "nixos";
  home.stateVersion = "24.05";
}
