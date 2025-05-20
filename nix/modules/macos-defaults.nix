{ pkgs, ... }:

{
  system.defaults = {
    dock.autohide = false;
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark"; # modo oscuro
    };
    dock.persistent-apps = [
      "/System/Applications/System Settings.app/"
      "/System/Applications/Books.app/"
      "/Applications/Google Chrome.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/kitty.app/"
      "/Applications/Parallels Desktop.app/"
      "/Applications/Microsoft Word.app/"
      "/Applications/Microsoft Excel.app/"
      "/Applications/Microsoft PowerPoint.app/"
      "/Applications/WhatsApp.app/"
      "/Applications/Telegram.app/"
      "/Applications/Spotify.app/"
      "/System/Applications/Music.app/"
      "/System/Applications/App Store.app/"
    ];
  };
}

