{
  inputs = {
    # php85: init at 8.5.1 (https://github.com/NixOS/nixpkgs/pull/422308)
    nixpkgs.url = "github:drupol/nixpkgs/push-yzozlvtlorrx";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-on-droid }: {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs { system = "aarch64-linux"; };
      modules = [ ./nix-on-droid.nix ];
    };
  };
}
