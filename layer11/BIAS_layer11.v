module BIAS_layer11#(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_30_1;
wire [18*N_adder_tree-1:0] BIAS_30_2;
wire [18*N_adder_tree-1:0] BIAS_30_3;
wire [18*N_adder_tree-1:0] BIAS_30_4;
wire [18*N_adder_tree-1:0] BIAS_31_1;
wire [18*N_adder_tree-1:0] BIAS_31_2;
wire [18*N_adder_tree-1:0] BIAS_32_1;
wire [18*N_adder_tree-1:0] BIAS_32_2;
wire [18*N_adder_tree-1:0] BIAS_32_3;
wire [18*N_adder_tree-1:0] BIAS_32_4;
wire [18*N_adder_tree-1:0] BIAS_33_1;
wire [18*N_adder_tree-1:0] BIAS_33_2;
wire [18*N_adder_tree-1:0] BIAS_33_3;
wire [18*N_adder_tree-1:0] BIAS_33_4;
wire [18*N_adder_tree-1:0] BIAS_34_1;
wire [18*N_adder_tree-1:0] BIAS_34_2;
wire [18*N_adder_tree-1:0] BIAS_34_3;
wire [18*N_adder_tree-1:0] BIAS_34_4;
wire [18*N_adder_tree-1:0] BIAS_34_5;
wire [18*N_adder_tree-1:0] BIAS_34_6;
wire [18*N_adder_tree-1:0] BIAS_34_7;
wire [18*N_adder_tree-1:0] BIAS_34_8;
					   
wire [18*N_adder_tree-1:0] BIAS_30;
wire [18*N_adder_tree-1:0] BIAS_31;
wire [18*N_adder_tree-1:0] BIAS_32;
wire [18*N_adder_tree-1:0] BIAS_33;
wire [18*N_adder_tree-1:0] BIAS_34;


BIAS_layer11_30_1 #(N_adder_tree) BIAS_layer11_30_1 (BIAS_30_1);
BIAS_layer11_30_2 #(N_adder_tree) BIAS_layer11_30_2 (BIAS_30_2);
BIAS_layer11_30_3 #(N_adder_tree) BIAS_layer11_30_3 (BIAS_30_3);
BIAS_layer11_30_4 #(N_adder_tree) BIAS_layer11_30_4 (BIAS_30_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS30 (BIAS_30_1,BIAS_30_2,BIAS_30_3,BIAS_30_4,BIAS_30,z);

BIAS_layer11_31_1 #(N_adder_tree) BIAS_layer11_31_1 (BIAS_31_1);
BIAS_layer11_31_2 #(N_adder_tree) BIAS_layer11_31_2 (BIAS_31_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS31 (BIAS_31_2,BIAS_31_1,BIAS_31,z);

BIAS_layer11_32_1 #(N_adder_tree) BIAS_layer11_32_1 (BIAS_32_1);
BIAS_layer11_32_2 #(N_adder_tree) BIAS_layer11_32_2 (BIAS_32_2);
BIAS_layer11_32_3 #(N_adder_tree) BIAS_layer11_32_3 (BIAS_32_3);
BIAS_layer11_32_4 #(N_adder_tree) BIAS_layer11_32_4 (BIAS_32_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS32 (BIAS_32_1,BIAS_32_2,BIAS_32_3,BIAS_32_4,BIAS_32,z);


BIAS_layer11_33_1 #(N_adder_tree) BIAS_layer11_33_1 (BIAS_33_1);
BIAS_layer11_33_2 #(N_adder_tree) BIAS_layer11_33_2 (BIAS_33_2);
BIAS_layer11_33_3 #(N_adder_tree) BIAS_layer11_33_3 (BIAS_33_3);
BIAS_layer11_33_4 #(N_adder_tree) BIAS_layer11_33_4 (BIAS_33_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS33 (BIAS_33_1,BIAS_33_2,BIAS_33_3,BIAS_33_4,BIAS_33,z);

BIAS_layer11_34_1 #(N_adder_tree) BIAS_layer11_34_1 (BIAS_34_1);
BIAS_layer11_34_2 #(N_adder_tree) BIAS_layer11_34_2 (BIAS_34_2);
BIAS_layer11_34_3 #(N_adder_tree) BIAS_layer11_34_3 (BIAS_34_3);
BIAS_layer11_34_4 #(N_adder_tree) BIAS_layer11_34_4 (BIAS_34_4);
BIAS_layer11_34_5 #(N_adder_tree) BIAS_layer11_34_5 (BIAS_34_5);
BIAS_layer11_34_6 #(N_adder_tree) BIAS_layer11_34_6 (BIAS_34_6);
BIAS_layer11_34_7 #(N_adder_tree) BIAS_layer11_34_7 (BIAS_34_7);
BIAS_layer11_34_8 #(N_adder_tree) BIAS_layer11_34_8 (BIAS_34_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS34 (BIAS_34_8,BIAS_34_1,BIAS_34_2,BIAS_34_3,BIAS_34_4,BIAS_34_5,BIAS_34_6,BIAS_34_7,BIAS_34,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS11 (BIAS_30,BIAS_31,BIAS_32,BIAS_33,BIAS_34,288'b0,288'b0,288'b0,bias,u);

endmodule