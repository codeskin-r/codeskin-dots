{ pkgs, ... }:

{
  homebrew = {
    enable = true;

    casks = [
      "firefox"
      "iina"
      "the-unarchiver"
      "visual-studio-code"
      "kitty"
      "flameshot"
      "alacritty"
      "kodi"
    ];

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
  };

  nix-homebrew = {
    enable = true;
    user = "codeskin";
    autoMigrate = true;
  };
}

