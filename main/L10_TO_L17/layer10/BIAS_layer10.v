module BIAS_layer10#(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_25_1;
wire [18*N_adder_tree-1:0] BIAS_25_2;
wire [18*N_adder_tree-1:0] BIAS_25_3;
wire [18*N_adder_tree-1:0] BIAS_25_4;
wire [18*N_adder_tree-1:0] BIAS_26_1;
wire [18*N_adder_tree-1:0] BIAS_26_2;
wire [18*N_adder_tree-1:0] BIAS_27_1;
wire [18*N_adder_tree-1:0] BIAS_27_2;
wire [18*N_adder_tree-1:0] BIAS_27_3;
wire [18*N_adder_tree-1:0] BIAS_27_4;
wire [18*N_adder_tree-1:0] BIAS_28_1;
wire [18*N_adder_tree-1:0] BIAS_28_2;
wire [18*N_adder_tree-1:0] BIAS_28_3;
wire [18*N_adder_tree-1:0] BIAS_28_4;
wire [18*N_adder_tree-1:0] BIAS_29_1;
wire [18*N_adder_tree-1:0] BIAS_29_2;
wire [18*N_adder_tree-1:0] BIAS_29_3;
wire [18*N_adder_tree-1:0] BIAS_29_4;
wire [18*N_adder_tree-1:0] BIAS_29_5;
wire [18*N_adder_tree-1:0] BIAS_29_6;
wire [18*N_adder_tree-1:0] BIAS_29_7;
wire [18*N_adder_tree-1:0] BIAS_29_8;
					   
wire [18*N_adder_tree-1:0] BIAS_25;
wire [18*N_adder_tree-1:0] BIAS_26;
wire [18*N_adder_tree-1:0] BIAS_27;
wire [18*N_adder_tree-1:0] BIAS_28;
wire [18*N_adder_tree-1:0] BIAS_29;


BIAS_layer10_25_1 #(N_adder_tree) BIAS_layer10_25_1 (BIAS_25_1);
BIAS_layer10_25_2 #(N_adder_tree) BIAS_layer10_25_2 (BIAS_25_2);
BIAS_layer10_25_3 #(N_adder_tree) BIAS_layer10_25_3 (BIAS_25_3);
BIAS_layer10_25_4 #(N_adder_tree) BIAS_layer10_25_4 (BIAS_25_4);
mux_4_1_L10 #(N_adder_tree) mux_4_1_BIAS25 (BIAS_25_1,BIAS_25_2,BIAS_25_3,BIAS_25_4,BIAS_25,z);

BIAS_layer10_26_1 #(N_adder_tree) BIAS_layer10_26_1 (BIAS_26_1);
BIAS_layer10_26_2 #(N_adder_tree) BIAS_layer10_26_2 (BIAS_26_2);
mux_2_1_L10 #(N_adder_tree) mux_2_1_BIAS26 (BIAS_26_2,BIAS_26_1,BIAS_26,z);

BIAS_layer10_27_1 #(N_adder_tree) BIAS_layer10_27_1 (BIAS_27_1);
BIAS_layer10_27_2 #(N_adder_tree) BIAS_layer10_27_2 (BIAS_27_2);
BIAS_layer10_27_3 #(N_adder_tree) BIAS_layer10_27_3 (BIAS_27_3);
BIAS_layer10_27_4 #(N_adder_tree) BIAS_layer10_27_4 (BIAS_27_4);
mux_4_1_L10 #(N_adder_tree) mux_4_1_BIAS27 (BIAS_27_1,BIAS_27_2,BIAS_27_3,BIAS_27_4,BIAS_27,z);


BIAS_layer10_28_1 #(N_adder_tree) BIAS_layer10_28_1 (BIAS_28_1);
BIAS_layer10_28_2 #(N_adder_tree) BIAS_layer10_28_2 (BIAS_28_2);
BIAS_layer10_28_3 #(N_adder_tree) BIAS_layer10_28_3 (BIAS_28_3);
BIAS_layer10_28_4 #(N_adder_tree) BIAS_layer10_28_4 (BIAS_28_4);
mux_4_1_L10 #(N_adder_tree) mux_4_1_BIAS28 (BIAS_28_1,BIAS_28_2,BIAS_28_3,BIAS_28_4,BIAS_28,z);

BIAS_layer10_29_1 #(N_adder_tree) BIAS_layer10_29_1 (BIAS_29_1);
BIAS_layer10_29_2 #(N_adder_tree) BIAS_layer10_29_2 (BIAS_29_2);
BIAS_layer10_29_3 #(N_adder_tree) BIAS_layer10_29_3 (BIAS_29_3);
BIAS_layer10_29_4 #(N_adder_tree) BIAS_layer10_29_4 (BIAS_29_4);
BIAS_layer10_29_5 #(N_adder_tree) BIAS_layer10_29_5 (BIAS_29_5);
BIAS_layer10_29_6 #(N_adder_tree) BIAS_layer10_29_6 (BIAS_29_6);
BIAS_layer10_29_7 #(N_adder_tree) BIAS_layer10_29_7 (BIAS_29_7);
BIAS_layer10_29_8 #(N_adder_tree) BIAS_layer10_29_8 (BIAS_29_8);
mux_8_1_L10 #(N_adder_tree) mux_8_1_BIAS29 (BIAS_29_8,BIAS_29_1,BIAS_29_2,BIAS_29_3,BIAS_29_4,BIAS_29_5,BIAS_29_6,BIAS_29_7,BIAS_29,z);

mux_8_1_L10 #(N_adder_tree) mux_8_1_BIAS10 (BIAS_25,BIAS_26,BIAS_27,BIAS_28,BIAS_29,288'b0,288'b0,288'b0,bias,u);

endmodule