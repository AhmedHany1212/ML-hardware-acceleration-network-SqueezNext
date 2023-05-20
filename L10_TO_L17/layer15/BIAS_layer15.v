module BIAS_layer15 #(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_50_1;
wire [18*N_adder_tree-1:0] BIAS_50_2;
wire [18*N_adder_tree-1:0] BIAS_50_3;
wire [18*N_adder_tree-1:0] BIAS_50_4;
wire [18*N_adder_tree-1:0] BIAS_51_1;
wire [18*N_adder_tree-1:0] BIAS_51_2;
wire [18*N_adder_tree-1:0] BIAS_52_1;
wire [18*N_adder_tree-1:0] BIAS_52_2;
wire [18*N_adder_tree-1:0] BIAS_52_3;
wire [18*N_adder_tree-1:0] BIAS_52_4;
wire [18*N_adder_tree-1:0] BIAS_53_1;
wire [18*N_adder_tree-1:0] BIAS_53_2;
wire [18*N_adder_tree-1:0] BIAS_53_3;
wire [18*N_adder_tree-1:0] BIAS_53_4;
wire [18*N_adder_tree-1:0] BIAS_54_1;
wire [18*N_adder_tree-1:0] BIAS_54_2;
wire [18*N_adder_tree-1:0] BIAS_54_3;
wire [18*N_adder_tree-1:0] BIAS_54_4;
wire [18*N_adder_tree-1:0] BIAS_54_5;
wire [18*N_adder_tree-1:0] BIAS_54_6;
wire [18*N_adder_tree-1:0] BIAS_54_7;
wire [18*N_adder_tree-1:0] BIAS_54_8;
					   
wire [18*N_adder_tree-1:0] BIAS_50;
wire [18*N_adder_tree-1:0] BIAS_51;
wire [18*N_adder_tree-1:0] BIAS_52;
wire [18*N_adder_tree-1:0] BIAS_53;
wire [18*N_adder_tree-1:0] BIAS_54;


BIAS_layer15_50_1 #(N_adder_tree) BIAS_layer15_50_1 (BIAS_50_1);
BIAS_layer15_50_2 #(N_adder_tree) BIAS_layer15_50_2 (BIAS_50_2);
BIAS_layer15_50_3 #(N_adder_tree) BIAS_layer15_50_3 (BIAS_50_3);
BIAS_layer15_50_4 #(N_adder_tree) BIAS_layer15_50_4 (BIAS_50_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS50 (BIAS_50_1,BIAS_50_2,BIAS_50_3,BIAS_50_4,BIAS_50,z);

BIAS_layer15_51_1 #(N_adder_tree) BIAS_layer15_51_1 (BIAS_51_1);
BIAS_layer15_51_2 #(N_adder_tree) BIAS_layer15_51_2 (BIAS_51_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS51 (BIAS_51_2,BIAS_51_1,BIAS_51,z);

BIAS_layer15_52_1 #(N_adder_tree) BIAS_layer15_52_1 (BIAS_52_1);
BIAS_layer15_52_2 #(N_adder_tree) BIAS_layer15_52_2 (BIAS_52_2);
BIAS_layer15_52_3 #(N_adder_tree) BIAS_layer15_52_3 (BIAS_52_3);
BIAS_layer15_52_4 #(N_adder_tree) BIAS_layer15_52_4 (BIAS_52_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS52 (BIAS_52_1,BIAS_52_2,BIAS_52_3,BIAS_52_4,BIAS_52,z);


BIAS_layer15_53_1 #(N_adder_tree) BIAS_layer15_53_1 (BIAS_53_1);
BIAS_layer15_53_2 #(N_adder_tree) BIAS_layer15_53_2 (BIAS_53_2);
BIAS_layer15_53_3 #(N_adder_tree) BIAS_layer15_53_3 (BIAS_53_3);
BIAS_layer15_53_4 #(N_adder_tree) BIAS_layer15_53_4 (BIAS_53_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS53 (BIAS_53_1,BIAS_53_2,BIAS_53_3,BIAS_53_4,BIAS_53,z);

BIAS_layer15_54_1 #(N_adder_tree) BIAS_layer15_54_1 (BIAS_54_1);
BIAS_layer15_54_2 #(N_adder_tree) BIAS_layer15_54_2 (BIAS_54_2);
BIAS_layer15_54_3 #(N_adder_tree) BIAS_layer15_54_3 (BIAS_54_3);
BIAS_layer15_54_4 #(N_adder_tree) BIAS_layer15_54_4 (BIAS_54_4);
BIAS_layer15_54_5 #(N_adder_tree) BIAS_layer15_54_5 (BIAS_54_5);
BIAS_layer15_54_6 #(N_adder_tree) BIAS_layer15_54_6 (BIAS_54_6);
BIAS_layer15_54_7 #(N_adder_tree) BIAS_layer15_54_7 (BIAS_54_7);
BIAS_layer15_54_8 #(N_adder_tree) BIAS_layer15_54_8 (BIAS_54_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS54 (BIAS_54_8,BIAS_54_1,BIAS_54_2,BIAS_54_3,BIAS_54_4,BIAS_54_5,BIAS_54_6,BIAS_54_7,BIAS_54,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS15 (BIAS_50,BIAS_51,BIAS_52,BIAS_53,BIAS_54,288'b0,288'b0,288'b0,bias,u);

endmodule