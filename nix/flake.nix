{
  description = "Configuración Nix-Darwin en macOS con QEMU/HVF";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
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
        neofetch asciiquarium cava
        yt-dlp vlc-bin python3 go rustc cargo docker
        jq httpie nixpkgs-fmt htop lsof watch tree virt-viewer
        wireguard-tools mas nix-index nix-search-cli
        ffmpeg-full colima osu-lazer-bin docker-compose
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

