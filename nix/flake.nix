{
  description = "Mac Pro 15 config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, ... }:
  let
    configuration = { pkgs, ... }: {
      imports = [
        ./modules/homebrew.nix
        ./modules/macos-defaults.nix
      ];

      environment.systemPackages = with pkgs; [
        vim fzf zoxide pixcat spotify spicetify-cli asciiquarium
        tmux neovim bat lazygit obsidian ffmpeg
        nmap gobuster wfuzz nikto tcpdump whois
        neofetch nodejs
      ];

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowBroken = true;
          allowUnsupportedSystem = true;
        };
        hostPlatform = "x86_64-darwin";
      };

      nix.settings.experimental-features = "nix-command flakes";

      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 6;
      };
    };
  in
  {
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

