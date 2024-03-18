{
  description = "Evince with multiple zathura-like patches.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.evince = (nixpkgs.legacyPackages.x86_64-linux.extend (import ./overlay.nix)).evince;

    packages.x86_64-linux.default = self.packages.x86_64-linux.evince;
  };
}
