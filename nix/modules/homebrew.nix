{ pkgs, ... }:

{
  homebrew = {
    enable = true;

    brews = [
     "mas"
     "node"
     "python-tk"
    ];

    casks = [
      "firefox"
      "iina"
      "the-unarchiver"
      "visual-studio-code"
      "flameshot"
      "kodi"
      "ghostty"
      "qbittorrent"
    ];

    masApps = {
      "WhatsApp Messenger" = 310633997;
      "Telegram" = 747648890;
    };

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
  };
}

