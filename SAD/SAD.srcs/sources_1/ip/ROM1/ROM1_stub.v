// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed May  8 09:40:01 2019
// Host        : DESKTOP-M082MKH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital
//               2/2019_1/SAD/SAD.srcs/sources_1/ip/ROM1/ROM1_stub.v}
// Design      : ROM1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *)
module ROM1(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],spo[7:0]" */;
  input [7:0]a;
  output [7:0]spo;
endmodule