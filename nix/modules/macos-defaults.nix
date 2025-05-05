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
      "/Applications/Google Chrome.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/VMware Fusion.app/"
      "/Applications/Ghostty.app/"
      "/Applications/Kitty.app/"
      "/Applications/Alacritty.app/"
      "/Applications/WhatsApp.app/"
      "/Applications/Telegram.app/"
      "/Applications/Spotify.app/"
      "/System/Applications/Music.app/"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "/System/Applications/Utilities/Activity Monitor.app/"
      "/Applications/Canva.app/"
      "/Applications/Kodi.app/"
      "/Applications/balenaEtcher.app/"
      "/Applications/OpenMTP.app/"
      "/System/Applications/App Store.app/"
    ];
  };
}

