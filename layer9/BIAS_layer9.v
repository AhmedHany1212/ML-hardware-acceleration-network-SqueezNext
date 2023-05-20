module BIAS_layer9 #(parameter N_adder_tree=16)(q,z,u);
input  wire	[2:0]				  z,u;
output wire [N_adder_tree*18-1:0] q;

wire [N_adder_tree*18-1:0]  BIAS_19;
wire [N_adder_tree*18-1:0]  BIAS_20;
wire [N_adder_tree*18-1:0]  BIAS_21;
wire [N_adder_tree*18-1:0]  BIAS_22;
wire [N_adder_tree*18-1:0]  BIAS_23;
wire [N_adder_tree*18-1:0]  BIAS_24;


BIAS_layer9_19  #(N_adder_tree) BIAS_layer9_19 (BIAS_19,z);
BIAS_layer9_20  #(N_adder_tree) BIAS_layer9_20 (BIAS_20,z);
BIAS_layer9_21  #(N_adder_tree) BIAS_layer9_21 (BIAS_21,z);
BIAS_layer9_22  #(N_adder_tree) BIAS_layer9_22 (BIAS_22,z);
BIAS_layer9_23  #(N_adder_tree) BIAS_layer9_23 (BIAS_23,z);
BIAS_layer9_24  #(N_adder_tree) BIAS_layer9_24 (BIAS_24,z);

mux_8_1_L9 #(N_adder_tree) mux_8_1_BIAS24(BIAS_19,BIAS_20,BIAS_21,BIAS_22,BIAS_23,BIAS_24,288'b0,288'b0,q,u);

endmodule