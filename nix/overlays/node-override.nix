# overlays/node-override.nix
self: super: {
  nodejs = super.nodejs.overrideAttrs (oldAttrs: {
    doCheck = false;
  });
}

