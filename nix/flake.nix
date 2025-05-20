{
  description = "Configuración Nix-Darwin en macOS con QEMU/HVF";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }: let
    systemConfig = { pkgs, ... }: {
      imports = [
        ./modules/spicetify.nix
        ./modules/homebrew.nix
        ./modules/macos-defaults.nix
        ./modules/qemu-dev.nix
      ];

      environment.systemPackages = with pkgs; [
        vim fzf zoxide pixcat tmux neovim bat lazygit
        nmap gobuster wfuzz nikto tcpdump whois
        neofetch asciiquarium virt-viewer 
        yt-dlp vlc-bin python3 go rustc cargo docker
        jq httpie nixpkgs-fmt htop lsof watch tree
        wireguard-tools mas nix-index nix-search-cli
        ffmpeg-full colima osu-lazer-bin docker-compose

      ## CLI utility
    # ani-cli
    # aoc-cli                           # Advent of Code command-line tool
    # binsider
    # bitwise                           # cli tool for bit / hex manipulation
    # caligula                          # User-friendly, lightweight TUI for disk imaging
    # dconf-editor
    # docfd                             # TUI multiline fuzzy document finder
    # dysk                              # disk information
    # eza                               # ls replacement
    # entr                              # perform action when file change
    # fd                                # find replacement
    # ffmpeg
    # file                              # Show file information 
    # gtt                               # google translate TUI
    # gifsicle                          # gif utility
    # gtrash                            # rm replacement, put deleted files in system trash
    # hevi                              # hex viewer
    # hexdump
    # htop
    # imv                               # image viewer
    # jq                                # JSON processor
    # killall
    # libnotify
    # lowfi
    # man-pages                         # extra man pages
    # mimeo
    # mpv                               # video player
    # ncdu                              # disk space
    # nitch                             # systhem fetch util
    # nixd                              # nix lsp
    # nixfmt-rfc-style                  # nix formatter
    # openssl
    # onefetch                          # fetch utility for git repo
    # pamixer                           # pulseaudio command line mixer
    # playerctl                         # controller for media players
    # poweralertd
    # programmer-calculator
    # ripgrep                           # grep replacement
    # shfmt                             # bash formatter
    # swappy                            # snapshot editing tool
    # tdf                               # cli pdf viewer
    # treefmt                           # project formatter
    # tldr
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    # unzip
    # valgrind                          # c memory analyzer
    # wavemon                           # monitoring for wireless network devices
    # wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    # wget
    # woomer
    # yt-dlp-light
    # xdg-utils
    # xxd

    ## CLI 
    # cbonsai                           # terminal screensaver
    # cmatrix
    # pipes                             # terminal screensaver
    # sl
    # tty-clock                         # cli clock

    ## GUI Apps
    # audacity
    # bleachbit                         # cache cleaner
    # gimp 
    # gnome-disk-utility
    # ldtk                              # 2D level editor
    # tiled                             # tile map editor
    # libreoffice
    # nix-prefetch-github
    # obs-studio
    # pavucontrol                       # pulseaudio volume controle (GUI)
    # pitivi                            # video editing
    # gnome-calculator                  # calculator
    # mission-center                    # GUI resources monitor
    # soundwireserver
    # vlc
    # winetricks
    # wineWowPackages.wayland
    # zenity

    # C / C++
    # gcc
    # gdb
    # cmake
    # gnumake
        prismlauncher jdk17
      ];

      environment.etc."zprofile.d/00-start-colima".text = ''
        if ! colima status &> /dev/null; then
          echo "⏳ Iniciando Colima..."
          colima start
        fi
      '';

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowBroken = true;
          allowUnsupportedSystem = true;
        };
        hostPlatform = "x86_64-darwin";
      };

      nix.settings.experimental-features = "nix-command flakes";
      system.stateVersion = 5;
    };
  in {
    darwinConfigurations."Alt3rw0r1D" = nix-darwin.lib.darwinSystem {
      modules = [ systemConfig ];
    };

    darwinPackages = self.darwinConfigurations."Alt3rw0r1D".pkgs;
  };
}

