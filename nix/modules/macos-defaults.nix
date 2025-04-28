{ pkgs, ... }:

{
  system.defaults = {
    dock.autohide = true;
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark"; # modo oscuro
    };
    dock.persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Visual Studio Code.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "${pkgs.spotify}/Applications/Spotify.app"
      "/Applications/WhatsApp.app/"
      "/Applications/Telegram.app/"
      "/Applications/Kitty.app/"
      "/System/Applications/Music.app/"
      "/System/Applications/System Preferences.app/"
      "/System/Applications/Utilities/Activity Monitor.app/"
    ];
  };
}

