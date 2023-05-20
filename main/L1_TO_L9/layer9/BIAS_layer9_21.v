module BIAS_layer9_21 #(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_21_1;
wire [N_adder_tree*18-1:0] BIAS_21_2;

BIAS_layer9_21_1 #(N_adder_tree) BIAS_layer9_21_1 (BIAS_21_1);
BIAS_layer9_21_2 #(N_adder_tree) BIAS_layer9_21_2 (BIAS_21_2);

mux_2_1_L9 #(N_adder_tree) mux_2_1_BIAS21(BIAS_21_2,BIAS_21_1,q,z);

endmodule