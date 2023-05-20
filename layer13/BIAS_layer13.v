module BIAS_layer13 #(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_40_1;
wire [18*N_adder_tree-1:0] BIAS_40_2;
wire [18*N_adder_tree-1:0] BIAS_40_3;
wire [18*N_adder_tree-1:0] BIAS_40_4;
wire [18*N_adder_tree-1:0] BIAS_41_1;
wire [18*N_adder_tree-1:0] BIAS_41_2;
wire [18*N_adder_tree-1:0] BIAS_42_1;
wire [18*N_adder_tree-1:0] BIAS_42_2;
wire [18*N_adder_tree-1:0] BIAS_42_3;
wire [18*N_adder_tree-1:0] BIAS_42_4;
wire [18*N_adder_tree-1:0] BIAS_43_1;
wire [18*N_adder_tree-1:0] BIAS_43_2;
wire [18*N_adder_tree-1:0] BIAS_43_3;
wire [18*N_adder_tree-1:0] BIAS_43_4;
wire [18*N_adder_tree-1:0] BIAS_44_1;
wire [18*N_adder_tree-1:0] BIAS_44_2;
wire [18*N_adder_tree-1:0] BIAS_44_3;
wire [18*N_adder_tree-1:0] BIAS_44_4;
wire [18*N_adder_tree-1:0] BIAS_44_5;
wire [18*N_adder_tree-1:0] BIAS_44_6;
wire [18*N_adder_tree-1:0] BIAS_44_7;
wire [18*N_adder_tree-1:0] BIAS_44_8;
					   
wire [18*N_adder_tree-1:0] BIAS_40;
wire [18*N_adder_tree-1:0] BIAS_41;
wire [18*N_adder_tree-1:0] BIAS_42;
wire [18*N_adder_tree-1:0] BIAS_43;
wire [18*N_adder_tree-1:0] BIAS_44;


BIAS_layer13_40_1 #(N_adder_tree) BIAS_layer13_40_1 (BIAS_40_1);
BIAS_layer13_40_2 #(N_adder_tree) BIAS_layer13_40_2 (BIAS_40_2);
BIAS_layer13_40_3 #(N_adder_tree) BIAS_layer13_40_3 (BIAS_40_3);
BIAS_layer13_40_4 #(N_adder_tree) BIAS_layer13_40_4 (BIAS_40_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS40 (BIAS_40_1,BIAS_40_2,BIAS_40_3,BIAS_40_4,BIAS_40,z);

BIAS_layer13_41_1 #(N_adder_tree) BIAS_layer13_41_1 (BIAS_41_1);
BIAS_layer13_41_2 #(N_adder_tree) BIAS_layer13_41_2 (BIAS_41_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS41 (BIAS_41_2,BIAS_41_1,BIAS_41,z);

BIAS_layer13_42_1 #(N_adder_tree) BIAS_layer13_42_1 (BIAS_42_1);
BIAS_layer13_42_2 #(N_adder_tree) BIAS_layer13_42_2 (BIAS_42_2);
BIAS_layer13_42_3 #(N_adder_tree) BIAS_layer13_42_3 (BIAS_42_3);
BIAS_layer13_42_4 #(N_adder_tree) BIAS_layer13_42_4 (BIAS_42_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS42 (BIAS_42_1,BIAS_42_2,BIAS_42_3,BIAS_42_4,BIAS_42,z);


BIAS_layer13_43_1 #(N_adder_tree) BIAS_layer13_43_1 (BIAS_43_1);
BIAS_layer13_43_2 #(N_adder_tree) BIAS_layer13_43_2 (BIAS_43_2);
BIAS_layer13_43_3 #(N_adder_tree) BIAS_layer13_43_3 (BIAS_43_3);
BIAS_layer13_43_4 #(N_adder_tree) BIAS_layer13_43_4 (BIAS_43_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS43 (BIAS_43_1,BIAS_43_2,BIAS_43_3,BIAS_43_4,BIAS_43,z);

BIAS_layer13_44_1 #(N_adder_tree) BIAS_layer13_44_1 (BIAS_44_1);
BIAS_layer13_44_2 #(N_adder_tree) BIAS_layer13_44_2 (BIAS_44_2);
BIAS_layer13_44_3 #(N_adder_tree) BIAS_layer13_44_3 (BIAS_44_3);
BIAS_layer13_44_4 #(N_adder_tree) BIAS_layer13_44_4 (BIAS_44_4);
BIAS_layer13_44_5 #(N_adder_tree) BIAS_layer13_44_5 (BIAS_44_5);
BIAS_layer13_44_6 #(N_adder_tree) BIAS_layer13_44_6 (BIAS_44_6);
BIAS_layer13_44_7 #(N_adder_tree) BIAS_layer13_44_7 (BIAS_44_7);
BIAS_layer13_44_8 #(N_adder_tree) BIAS_layer13_44_8 (BIAS_44_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS44 (BIAS_44_8,BIAS_44_1,BIAS_44_2,BIAS_44_3,BIAS_44_4,BIAS_44_5,BIAS_44_6,BIAS_44_7,BIAS_44,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS13 (BIAS_40,BIAS_41,BIAS_42,BIAS_43,BIAS_44,288'b0,288'b0,288'b0,bias,u);

endmodule