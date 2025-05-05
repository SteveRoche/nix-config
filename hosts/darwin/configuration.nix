{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.extraOptions = ''
    extra-platforms = aarch64-darwin
  '';
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
    };
    dock = {
      autohide = true;
      mru-spaces = false;
      magnification = true;
      persistent-apps = [
        "/Applications/Horse 2.app"
        "/Applications/Zen Browser.app"
        {spacer = {small = true;};}
        "/Applications/Proton Mail.app"
        "/Applications/TickTick.app"
        "/Applications/Obsidian.app"
        "/Applications/Linear.app"
        {spacer = {small = true;};}
        "/Applications/Ghostty.app"
        "/Applications/Visual Studio Code.app"
        {spacer = {small = true;};}
        "/Applications/NetNewsWire.app"
        "/Applications/Zotero.app"
        "/Applications/Numi.app"
      ];
      minimize-to-application = true;
      persistent-others = [];
      show-recents = false;
      tilesize = 48;
      largesize = 72;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true; # Show hidden files
      CreateDesktop = true;
    };
    screensaver.askForPasswordDelay = 10; # seconds
    screencapture.location = "~/Pictures/Screenshots";
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  users.users.steve.home = "/Users/steve";

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    taps = ["cfergeau/crc"];
    brews = [
      "vfkit" # https://github.com/NixOS/nixpkgs/issues/305868
    ];
    casks = [
      "zen-browser"
      "obsidian"
      "raycast"
      "proton-pass"
      "protonvpn"
      "proton-mail"
      "proton-drive"
      "ticktick"
      "whatsapp"
      "blender"
      "discord"
      "keepingyouawake"
      "steam"
      "netnewswire"
      "yt-music"
      "pomatez"
      # "unnaturalscrollwheels"
      "grandperspective"
      "numi"
      "linear-linear"
      "zotero"

      # GUI developer tools
      "ghostty"
      "visual-studio-code"
      "github"
      "imhex"

      # Fonts
      "font-fragment-mono"
      "font-fira-code-nerd-font"
    ];
  };

  system.stateVersion = 4;
}
