module BIAS_layer9_23 #(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_23_1;
wire [N_adder_tree*18-1:0] BIAS_23_2;
wire [N_adder_tree*18-1:0] BIAS_23_3;
wire [N_adder_tree*18-1:0] BIAS_23_4;


mux_4_1_L9 #(N_adder_tree) mux_4_1_BIAS23 (BIAS_23_1,BIAS_23_2,BIAS_23_3,BIAS_23_4,q,z);

BIAS_layer9_23_1 #(N_adder_tree) BIAS_layer9_23_1 (BIAS_23_1);
BIAS_layer9_23_2 #(N_adder_tree) BIAS_layer9_23_2 (BIAS_23_2);
BIAS_layer9_23_3 #(N_adder_tree) BIAS_layer9_23_3 (BIAS_23_3);
BIAS_layer9_23_4 #(N_adder_tree) BIAS_layer9_23_4 (BIAS_23_4);


endmodule