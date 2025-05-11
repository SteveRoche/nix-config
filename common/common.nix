{
  config,
  pkgs,
  ...
}: {
  nix.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI tools
    wget
    zoxide
    bat
    tree
    jq
    fd
    ripgrep
    fzf
    yazi
    cloc
    just
    pdftk

    # Git
    gitAndTools.gitFull
    git-extras
    gh
    lazygit
    gnupg
    delta

    # Terminal editors
    vim
    neovim
    helix

    # Languages
    rustup
    python312

    nodejs_22
    deno
    nodePackages.pnpm

    zig
    zls

    go
    gopls

    cmake
    lldb_18

    alejandra
    lua-language-server
    (texlive.combine {
      inherit
        (texlive)
        scheme-medium
        titlesec
        textpos
        isodate
        substr
        ;
    })

    # Containers
    podman
    podman-compose
    kind
    kubectl
    kustomize_4
    kubernetes-helm

    # Misc
    home-manager
    shaderc
    hugo
    dart-sass
  ];
}
