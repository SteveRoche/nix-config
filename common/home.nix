{pkgs, ...}: {
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
  home.packages = with pkgs; [home-manager];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file = {
    ".zprofile".source = ./dotfiles/zprofile;
    ".zshrc".source = ./dotfiles/zshrc;
    ".p10k.zsh".source = ./dotfiles/p10k.zsh;
    ".gitconfig".source = ./dotfiles/gitconfig;
    ".config/helix/config.toml".source = ./dotfiles/helix/config.toml;
    ".config/helix/languages.toml".source = ./dotfiles/helix/languages.toml;
    ".config/nvim" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };
    ".config/ghostty/config".source = ./dotfiles/ghostty;
    ".config/lazygit/config.yml".source = ./dotfiles/lazygit.yml;
    ".config/delta/themes.gitconfig".source = ./dotfiles/delta-themes.gitconfig;
  };
}
