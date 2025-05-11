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
        "/Applications/Safari.app"
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
    CustomUserPreferences = {
      "com.raycast.macos" = {
        raycastPreferredWindowMode = "compact";
        raycastShouldFollowSystemAppearance = true;
        raycastGlobalHotkey = "Command-49"; # Cmd+Space
      };

      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Disable Spotlight and Finder window hotkeys to replace with Raycast
          "64" = {
            enabled = 0;
            value = {
              parameters = [32 49 1048576];
              type = "standard";
            };
          };
          "65" = {
            enabled = 0;
            value = {
              parameters = [32 49 1572864];
              type = "standard";
            };
          };
        };
      };
    };
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
      "adguard"
      "alt-tab"
      "blender"
      "calibre"
      "db-browser-for-sqlite"
      "discord"
      "font-fira-code-nerd-font"
      "font-fragment-mono"
      "font-jetbrains-mono"
      "ghostty"
      "github"
      "grandperspective"
      "imhex"
      "keepingyouawake"
      "linear-linear"
      "netnewswire"
      "numi"
      "obsidian"
      "pomatez"
      "proton-drive"
      "proton-mail"
      "proton-mail-bridge"
      "proton-pass"
      "protonvpn"
      "raycast"
      "steam"
      "sublime-text"
      "ticktick"
      "visual-studio-code"
      "whatsapp"
      "whisky"
      "yt-music"
      "zotero"
      # "unnaturalscrollwheels"
    ];
  };

  system.stateVersion = 4;
}
