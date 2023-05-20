module BIAS_layer12 #(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_35_1;
wire [18*N_adder_tree-1:0] BIAS_35_2;
wire [18*N_adder_tree-1:0] BIAS_35_3;
wire [18*N_adder_tree-1:0] BIAS_35_4;
wire [18*N_adder_tree-1:0] BIAS_36_1;
wire [18*N_adder_tree-1:0] BIAS_36_2;
wire [18*N_adder_tree-1:0] BIAS_37_1;
wire [18*N_adder_tree-1:0] BIAS_37_2;
wire [18*N_adder_tree-1:0] BIAS_37_3;
wire [18*N_adder_tree-1:0] BIAS_37_4;
wire [18*N_adder_tree-1:0] BIAS_38_1;
wire [18*N_adder_tree-1:0] BIAS_38_2;
wire [18*N_adder_tree-1:0] BIAS_38_3;
wire [18*N_adder_tree-1:0] BIAS_38_4;
wire [18*N_adder_tree-1:0] BIAS_39_1;
wire [18*N_adder_tree-1:0] BIAS_39_2;
wire [18*N_adder_tree-1:0] BIAS_39_3;
wire [18*N_adder_tree-1:0] BIAS_39_4;
wire [18*N_adder_tree-1:0] BIAS_39_5;
wire [18*N_adder_tree-1:0] BIAS_39_6;
wire [18*N_adder_tree-1:0] BIAS_39_7;
wire [18*N_adder_tree-1:0] BIAS_39_8;
					   
wire [18*N_adder_tree-1:0] BIAS_35;
wire [18*N_adder_tree-1:0] BIAS_36;
wire [18*N_adder_tree-1:0] BIAS_37;
wire [18*N_adder_tree-1:0] BIAS_38;
wire [18*N_adder_tree-1:0] BIAS_39;


BIAS_layer12_35_1 #(N_adder_tree) BIAS_layer12_35_1 (BIAS_35_1);
BIAS_layer12_35_2 #(N_adder_tree) BIAS_layer12_35_2 (BIAS_35_2);
BIAS_layer12_35_3 #(N_adder_tree) BIAS_layer12_35_3 (BIAS_35_3);
BIAS_layer12_35_4 #(N_adder_tree) BIAS_layer12_35_4 (BIAS_35_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS35 (BIAS_35_1,BIAS_35_2,BIAS_35_3,BIAS_35_4,BIAS_35,z);

BIAS_layer12_36_1 #(N_adder_tree) BIAS_layer12_36_1 (BIAS_36_1);
BIAS_layer12_36_2 #(N_adder_tree) BIAS_layer12_36_2 (BIAS_36_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS36 (BIAS_36_2,BIAS_36_1,BIAS_36,z);

BIAS_layer12_37_1 #(N_adder_tree) BIAS_layer12_37_1 (BIAS_37_1);
BIAS_layer12_37_2 #(N_adder_tree) BIAS_layer12_37_2 (BIAS_37_2);
BIAS_layer12_37_3 #(N_adder_tree) BIAS_layer12_37_3 (BIAS_37_3);
BIAS_layer12_37_4 #(N_adder_tree) BIAS_layer12_37_4 (BIAS_37_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS37 (BIAS_37_1,BIAS_37_2,BIAS_37_3,BIAS_37_4,BIAS_37,z);


BIAS_layer12_38_1 #(N_adder_tree) BIAS_layer12_38_1 (BIAS_38_1);
BIAS_layer12_38_2 #(N_adder_tree) BIAS_layer12_38_2 (BIAS_38_2);
BIAS_layer12_38_3 #(N_adder_tree) BIAS_layer12_38_3 (BIAS_38_3);
BIAS_layer12_38_4 #(N_adder_tree) BIAS_layer12_38_4 (BIAS_38_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS38 (BIAS_38_1,BIAS_38_2,BIAS_38_3,BIAS_38_4,BIAS_38,z);

BIAS_layer12_39_1 #(N_adder_tree) BIAS_layer12_39_1 (BIAS_39_1);
BIAS_layer12_39_2 #(N_adder_tree) BIAS_layer12_39_2 (BIAS_39_2);
BIAS_layer12_39_3 #(N_adder_tree) BIAS_layer12_39_3 (BIAS_39_3);
BIAS_layer12_39_4 #(N_adder_tree) BIAS_layer12_39_4 (BIAS_39_4);
BIAS_layer12_39_5 #(N_adder_tree) BIAS_layer12_39_5 (BIAS_39_5);
BIAS_layer12_39_6 #(N_adder_tree) BIAS_layer12_39_6 (BIAS_39_6);
BIAS_layer12_39_7 #(N_adder_tree) BIAS_layer12_39_7 (BIAS_39_7);
BIAS_layer12_39_8 #(N_adder_tree) BIAS_layer12_39_8 (BIAS_39_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS39 (BIAS_39_8,BIAS_39_1,BIAS_39_2,BIAS_39_3,BIAS_39_4,BIAS_39_5,BIAS_39_6,BIAS_39_7,BIAS_39,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS12 (BIAS_35,BIAS_36,BIAS_37,BIAS_38,BIAS_39,288'b0,288'b0,288'b0,bias,u);

endmodule