module BIAS_layer9_24#(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_24_1;
wire [N_adder_tree*18-1:0] BIAS_24_2;
wire [N_adder_tree*18-1:0] BIAS_24_3;
wire [N_adder_tree*18-1:0] BIAS_24_4;
wire [N_adder_tree*18-1:0] BIAS_24_5;
wire [N_adder_tree*18-1:0] BIAS_24_6;
wire [N_adder_tree*18-1:0] BIAS_24_7;
wire [N_adder_tree*18-1:0] BIAS_24_8;


mux_8_1_L9 #(N_adder_tree) mux_8_1_BIAS24 (BIAS_24_8,BIAS_24_1,BIAS_24_2,BIAS_24_3,BIAS_24_4,BIAS_24_5,BIAS_24_6,BIAS_24_7,q,z);

BIAS_layer9_24_1 #(N_adder_tree) BIAS_layer9_24_1 (BIAS_24_1);
BIAS_layer9_24_2 #(N_adder_tree) BIAS_layer9_24_2 (BIAS_24_2);
BIAS_layer9_24_3 #(N_adder_tree) BIAS_layer9_24_3 (BIAS_24_3);
BIAS_layer9_24_4 #(N_adder_tree) BIAS_layer9_24_4 (BIAS_24_4);
BIAS_layer9_24_5 #(N_adder_tree) BIAS_layer9_24_5 (BIAS_24_5);
BIAS_layer9_24_6 #(N_adder_tree) BIAS_layer9_24_6 (BIAS_24_6);
BIAS_layer9_24_7 #(N_adder_tree) BIAS_layer9_24_7 (BIAS_24_7);
BIAS_layer9_24_8 #(N_adder_tree) BIAS_layer9_24_8 (BIAS_24_8);

endmodule