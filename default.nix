let
  nixpkgs = import <nixpkgs>;

  pkgs = nixpkgs { overlays = [ (import ./nix) ]; };

  inherit (pkgs.nix-gitignore) gitignoreSource;

  crossSystem =
    pkgs.lib.recursiveUpdate pkgs.lib.systems.examples.riscv32-embedded {
      platform.gcc.arch = "rv32imac";
    };

  riscvPkgs = nixpkgs { inherit crossSystem; };

in with pkgs;

rec {
  inherit pkgs riscvPkgs;

  newlib-nano = riscvPkgs.callPackage nix/newlib-nano.nix { };

  image = riscvPkgs.runCommandCC "image.elf" { } "$CC ${./main.c} -o $out";

  test = runCommandCC "pqvexriscvtest" {
    src = image;
    nativeBuildInputs =
      [ pqvexriscv verilator riscvPkgs.stdenv.cc.bintools.bintools jdk ];
  } ''
    ${riscvPkgs.hostPlatform.config}-objcopy -O binary $src image.bin
    pqvexriscvsim --ram 256,128 --init image.bin --uart $out
  '';
}
