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
    ".zshrc".source = ./dotfiles/zshrc;
  };
}
