# nix-config

```
$ nix-env -i git
$ git clone https://github.com/SteveRoche/nix-config ~/nix-config
$ cd ~/nix-config
$ sudo nixos-rebuild switch --flake .#wsl # Windows
$ sudo nixos-rebuild switch --flake .#macos # MacOS
$ sudo nixos-rebuild switch --flake .#nixos # NixOS
```
