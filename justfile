default:
  @just --choose

switch host:
  @just {{ if host == "macos" { "switch-macos" } else if host == "wsl" { "switch-wsl" } else if host == "nixos" { "switch-nixos" } else { "switch-unknown {{host}}" } }}

switch-macos:
  darwin-rebuild switch --flake .#macos

switch-wsl:
  sudo nixos-rebuild switch --flake .#wsl

switch-nixos:
  sudo nixos-rebuild switch --flake .#nixos

switch-unknown host:
  @echo "Unknown host {{host}}"

fmt:
  alejandra .

check:
  nix flake show
  nix flake check
