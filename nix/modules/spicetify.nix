{ pkgs, ... }:

let
  spicetify = pkgs.callPackage ./modules/spicetify.nix {};
in {
  environment.systemPackages = with pkgs; [
    spicetify-cli 
  ];

  # Si quieres que se configure automáticamente:
  # systemd.services.spicetify = {
  #   description = "Spicetify service";
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.ExecStart = "${spicetify}/bin/spicetify";
  #   serviceConfig.Restart = "always";
  # };

  # Si Spicetify tiene configuraciones por hacer al activarlo
  environment.variables = {
    SPICETIFY_CONFIG_DIR = "/Users/codeskin/.config/spicetify";  # Cambia el path al de tu usuario
  };
}

