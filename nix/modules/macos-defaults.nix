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
      "/Applications/WhatsApp.app/"
      "/Applications/Telegram.app/"
      "/Applications/Kitty.app/"
      "/System/Applications/Music.app/"
      "/System/Applications/System Preferences.app/"
      "/System/Applications/Utilities/Activity Monitor.app/"
      "/Applications/Alacritty.app/"
      "/Applications/Spotify.app/"
      "/Applications/Canva.app/"
    ];
  };
}

