{
  description = "Mac Pro 15 config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Optional: Declarative tap management
    # homebrew-core = {
    #  url = "github:homebrew/homebrew-core";
    #  flake = true;
    #};
    #homebrew-cask = {
    #  url = "github:homebrew/homebrew-cask";
    #  flake = true;
    #};

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, ... }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
          pkgs.vim
          pkgs.fzf
          pkgs.zoxide
          pkgs.pixcat
          pkgs.spotify
          pkgs.spicetify-cli 
          pkgs.asciiquarium
          pkgs.tmux
          pkgs.neovim 
          pkgs.bat  
          pkgs.lazygit
          pkgs.obsidian
          pkgs.ffmpeg
          pkgs.nmap
          pkgs.gobuster
          pkgs.wfuzz
          pkgs.nikto
          pkgs.tcpdump
          pkgs.whois
          pkgs.neofetch
          
        ];
    
      homebrew = {
        enable = true;
        casks = [
           "firefox"
           "iina"
           "the-unarchiver"
           "visual-studio-code"
           "ghostty"
           "flameshot"
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      # Opciones de macOS
        system.defaults = {
         dock.autohide = true;
         finder.AppleShowAllExtensions = true;
         NSGlobalDomain.AppleShowAllExtensions = true;
         NSGlobalDomain.AppleInterfaceStyle = "Dark"; # modo oscuro
         finder.FXPreferredViewStyle = "clmv";
         dock.persistent-apps = [
          "/Applications/Google Chrome.app"
          "/Applications/Visual Studio Code.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "${pkgs.spotify}/Applications/Spotify.app"
          "/Applications/WhatsApp.app/"
          "/Applications/Telegram.app/" 
          "/Applications/Ghostty.app/"
          "/System/Applications/Music.app/"
          "/System/Applications/System Settings.app/"
          "/System/Applications/Utilities/Activity Monitor.app/"
         ];
      };

      # enable unfree apps 
      nixpkgs.config.allowUnfree = true;

      # enable broken packages 
      nixpkgs.config.allowBroken = true;

      # unsuported apps 
      nixpkgs.config.allowUnsupportedSystem = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Forzar el uso de libc++
      #  environment.variables = {
      #     NIX_LDFLAGS = "-lc++ -lc++abi";
      #};
    
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Alt3rw0r1D
    darwinConfigurations."Alt3rw0r1D" = nix-darwin.lib.darwinSystem {
      modules = [
         configuration
         nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # User owning the Homebrew prefix
            user = "codeskin";

            # Optional: Declarative tap management
            #taps = {
            #  "homebrew/homebrew-core" = homebrew-core;
            #  "homebrew/homebrew-cask" = homebrew-cask;
            #};

            # migracion automatica 
            autoMigrate = true;

            # Optional: Enable fully-declarative tap management
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            # mutableTaps = true;
          };
        } 
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Alt3rw0r1D".pkgs;
  };
}

