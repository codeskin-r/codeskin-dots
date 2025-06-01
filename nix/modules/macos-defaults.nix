{ pkgs, ... }:

{
  system.defaults = {
    dock = {
      autohide = false;
      magnification = true;
      tilesize = 36;
      largesize = 64;
      minimize-to-application = true;
      show-recents = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv"; # Columnas
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark"; # modo oscuro
      _HIHideMenuBar = false; # Mostrar siempre la barra de menú
      AppleKeyboardUIMode = 3; # Habilitar control total del teclado (tab entre botones, menús, etc.)
      KeyRepeat = 1;           # Velocidad de repetición de teclas
      InitialKeyRepeat = 15;   # Tiempo antes de que empiece a repetir
      NSNavPanelExpandedStateForSaveMode = true; # Mostrar opciones avanzadas al guardar archivos
      NSNavPanelExpandedStateForSaveMode2 = true;
    };

    trackpad = {
      Clicking = true; # Tap to click
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    # Dock apps como ya tenías
    dock.persistent-apps = [
      "/System/Applications/System Settings.app/"
      "/System/Applications/Books.app/"
      "/Applications/FL Studio 2024.app/"
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
      "/Applications/Obsidian.app/" 
      "/System/Applications/Music.app/"
      "/System/Applications/App Store.app/"
    ];
  };
}
