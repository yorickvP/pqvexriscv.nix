{ mkShell, scala_2_11, sbt, ghdl, verilog, verilator }:
# sbt package && cp sim/target/scala-2.11/spinalhdl-sim_2.11-1.3.8.jar ../
mkShell {
  name = "spinalhdl-shell";
  buildInputs = [ scala_2_11 sbt ghdl verilog verilator ];
}
