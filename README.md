# nix-config

```bash
$ nix-env -i git
$ git clone https://github.com/SteveRoche/nix-config $HOME/nix-config
$ sudo rm -rf /etc/nixos/*
$ sudo ln -s $HOME/nix-config/hosts/desktop/configuration.nix /etc/nixos/configuration.nix
$ sudo nixos-rebuild switch
```
