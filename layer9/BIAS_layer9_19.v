module BIAS_layer9_19 #(parameter N_adder_tree=16)(q,z);
input  wire	[2:0]				  z;
output wire [N_adder_tree*18-1:0] q;


wire [N_adder_tree*18-1:0] BIAS_19_1;
wire [N_adder_tree*18-1:0] BIAS_19_2;
wire [N_adder_tree*18-1:0] BIAS_19_3;
wire [N_adder_tree*18-1:0] BIAS_19_4;
wire [N_adder_tree*18-1:0] BIAS_19_5;
wire [N_adder_tree*18-1:0] BIAS_19_6;
wire [N_adder_tree*18-1:0] BIAS_19_7;
wire [N_adder_tree*18-1:0] BIAS_19_8;


mux_8_1_L9 #(N_adder_tree) mux_8_1_BIAS19 (BIAS_19_8,BIAS_19_1,BIAS_19_2,BIAS_19_3,BIAS_19_4,BIAS_19_5,BIAS_19_6,BIAS_19_7,q,z);

BIAS_layer9_19_1 #(N_adder_tree) BIAS_layer9_19_1 (BIAS_19_1);
BIAS_layer9_19_2 #(N_adder_tree) BIAS_layer9_19_2 (BIAS_19_2);
BIAS_layer9_19_3 #(N_adder_tree) BIAS_layer9_19_3 (BIAS_19_3);
BIAS_layer9_19_4 #(N_adder_tree) BIAS_layer9_19_4 (BIAS_19_4);
BIAS_layer9_19_5 #(N_adder_tree) BIAS_layer9_19_5 (BIAS_19_5);
BIAS_layer9_19_6 #(N_adder_tree) BIAS_layer9_19_6 (BIAS_19_6);
BIAS_layer9_19_7 #(N_adder_tree) BIAS_layer9_19_7 (BIAS_19_7);
BIAS_layer9_19_8 #(N_adder_tree) BIAS_layer9_19_8 (BIAS_19_8);


endmodule