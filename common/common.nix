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

  environment.systemPackages = with pkgs; [
    # CLI tools
    wget
    zoxide
    tree
    jq
    fd
    ripgrep
    fzf
    lf
    cloc
    just

    # Git
    gitAndTools.gitFull
    git-extras
    gh
    lazygit

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
    kind
    kubectl
    kustomize_4

    # Misc
    shaderc
    hugo
    dart-sass
  ];
}
