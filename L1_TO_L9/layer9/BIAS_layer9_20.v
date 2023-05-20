module BIAS_layer9_20 #(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_20_1;
wire [N_adder_tree*18-1:0] BIAS_20_2;
wire [N_adder_tree*18-1:0] BIAS_20_3;
wire [N_adder_tree*18-1:0] BIAS_20_4;


mux_4_1_L9 #(N_adder_tree) mux_4_1_BIAS20 (BIAS_20_4,BIAS_20_1,BIAS_20_2,BIAS_20_3,q,z);

BIAS_layer9_20_1  #(N_adder_tree) BIAS_layer9_20_1  (BIAS_20_1);
BIAS_layer9_20_2  #(N_adder_tree) BIAS_layer9_20_2  (BIAS_20_2);
BIAS_layer9_20_3  #(N_adder_tree) BIAS_layer9_20_3  (BIAS_20_3);
BIAS_layer9_20_4  #(N_adder_tree) BIAS_layer9_20_4  (BIAS_20_4);


endmodule