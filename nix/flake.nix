{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";   
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, ... }: let

#    overlays = [
#      (import ./overlays/node-override.nix)
#    ];

    configuration = { pkgs, ... }: {
      imports = [
        ./modules/spicetify.nix
        ./modules/homebrew.nix
        ./modules/macos-defaults.nix
      ];

      environment.systemPackages = with pkgs; [
        vim fzf zoxide pixcat tmux neovim bat lazygit
        nmap gobuster wfuzz nikto tcpdump whois obsidian  
        neofetch fastfetch asciiquarium fastfetch cava 
        yt-dlp vlc-bin python3 go rustc cargo docker 
        jq httpie nixpkgs-fmt htop lsof watch
        wireguard-tools mas nix-index nix-search-cli 
        ffmpeg-full colima osu-lazer-bin

        prismlauncher
        jdk17
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
#        overlays = overlays;
      };

      nix.settings.experimental-features = "nix-command flakes";

      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 5;
      };
    };

  in {
    darwinConfigurations."Alt3rw0r1D" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/qemu-dev.nix
      ];
    };

    darwinPackages = self.darwinConfigurations."Alt3rw0r1D".pkgs;
  };
}

