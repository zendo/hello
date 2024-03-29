{
  description = "A flake for building Hello World";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = {
    self,
    nixpkgs,
  }: {

	{
      nixpkgs.overlays = overlays;
      # hardware.enableAllFirmware = true;
      hardware.enableRedistributableFirmware = true;
    }
  		
    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs {system = "x86_64-linux";};
        stdenv.mkDerivation {
          name = "hello";
          src = self;
          buildPhase = "gcc -o hello ./hello.c";
          installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
        };

    /*
     Song:       Drawing Dunes
     Artist:     Stan Forebee
     Album:      Chillhop Essentials - Fall 2018
     */
  };
}
