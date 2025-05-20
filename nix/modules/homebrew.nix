{ pkgs, ... }:

{
  homebrew = {
    enable = true;

    brews = [
     "mas"                     # App Store CLI
     "node"                    # Node.js
     "python-tk"               # Python GUI libs
    # "wget"                    # Descargas desde terminal
    # "curl"                    # Transferencias HTTP
    # "git"                     # Control de versiones
    # "neovim"                  # Editor de texto moderno
    # "ripgrep"                 # Búsqueda ultra rápida (mejor que grep)
    # "fd"                      # Búsqueda de archivos (mejor que find)
     "htop"                    # Monitor de procesos interactivo
    # "tmux"                    # Multiplexor de terminal
     "jq"                      # Procesador de JSON
    # "fzf"                     # Fuzzy finder
    # "bat"                     # Cat mejorado con resaltado
    # "tree"                    # Muestra árbol de directorios
    # "eza"                     # Sustituto moderno de `ls`
     "gh"                      # GitHub CLI
     "pnpm"                    # Gestor de paquetes para Node.js
     "openssl"                 # Librerías de criptografía
    ];

    casks = [
      "firefox"                 # Navegador web
      "iina"                    # Reproductor de video
      "the-unarchiver"          # Descompresor de archivos
      "visual-studio-code"      # Editor de código
      "flameshot"               # Capturas de pantalla
      "kodi"                    # Centro multimedia
      "qbittorrent"             # Cliente de torrent
      "ghostty"                 # Terminal moderna
      "kitty"                   # Terminal avanzada
      "raycast"                 # Lanzador productivo
      "monitorcontrol"          # Control de brillo de pantallas externas
      "rectangle"               # Organización de ventanas
      "appcleaner"              # Eliminación completa de apps
      "stats"                   # Monitor de sistema en barra de menú
      "iterm2"                  # Otra terminal poderosa
      "whatsapp"                # App de mensajería
      "telegram"                # Mensajería segura
      "raycast"               # Lanzador ultrarrápido de apps, snippets, comandos
  "rectangle"             # Gestión de ventanas con atajos de teclado
  "notion"                # Organización personal / trabajo
  # "obsidian"              # Markdown + enlaces bidireccionales (tipo second brain)
  "anki"                  # Flashcards para memorizar
  "maccy"                 # Historial de portapapeles rápido
  # "alfred"                # Automator avanzado (si no usás Raycast)
  "itsycal"               # Mini calendario en barra superior
  # "dozer"                 # Oculta iconos en la barra
  "appcleaner"            # Elimina apps + archivos residuales
  "onyx"                  # Utilidad de mantenimiento para macOS
  "hiddenbar"             # Para ocultar íconos del menú
  "coconutbattery"        # Info avanzada de batería
    ];

    # masApps = {
    #  "WhatsApp Messenger" = 310633997;
    #  "Telegram" = 747648890;
    # };

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}

