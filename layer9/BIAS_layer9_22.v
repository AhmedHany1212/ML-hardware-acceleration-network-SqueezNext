module BIAS_layer9_22 #(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_22_1;
wire [N_adder_tree*18-1:0] BIAS_22_2;
wire [N_adder_tree*18-1:0] BIAS_22_3;
wire [N_adder_tree*18-1:0] BIAS_22_4;


mux_4_1_L9 #(N_adder_tree) mux_4_1_BIAS22 (BIAS_22_1,BIAS_22_2,BIAS_22_3,BIAS_22_4,q,z);

BIAS_layer9_22_1 #(N_adder_tree) BIAS_layer9_22_1 (BIAS_22_1);
BIAS_layer9_22_2 #(N_adder_tree) BIAS_layer9_22_2 (BIAS_22_2);
BIAS_layer9_22_3 #(N_adder_tree) BIAS_layer9_22_3 (BIAS_22_3);
BIAS_layer9_22_4 #(N_adder_tree) BIAS_layer9_22_4 (BIAS_22_4);


endmodule