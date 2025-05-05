
{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    # Paquetes Homebrew; agregamos 'node' para instalar Node.js vía brew
    brews = [
      "mas"
      "node"
    ];

    # Aplicaciones Homebrew Casks
    casks = [
      "firefox"
      "iina"
      "the-unarchiver"
      "visual-studio-code"
      "kitty"
      "flameshot"
      "alacritty"
      "kodi"
      "ghostty"
    ];

    # Apps de Mac App Store
    masApps = {
      "WhatsApp Messenger" = 310633997;
      "Telegram" = 747648890;
    };

    # Opciones de activación: actualizar y upgrade automáticos
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
  };

  # Configuración de nix-homebrew (migración de Brewfile, etc.)
  nix-homebrew = {
    enable = true;
    user = "codeskin";
    autoMigrate = true;
  };
}
