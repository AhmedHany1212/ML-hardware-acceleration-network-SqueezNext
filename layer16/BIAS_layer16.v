module BIAS_layer16 #(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_55_1;
wire [18*N_adder_tree-1:0] BIAS_55_2;
wire [18*N_adder_tree-1:0] BIAS_55_3;
wire [18*N_adder_tree-1:0] BIAS_55_4;
wire [18*N_adder_tree-1:0] BIAS_56_1;
wire [18*N_adder_tree-1:0] BIAS_56_2;
wire [18*N_adder_tree-1:0] BIAS_57_1;
wire [18*N_adder_tree-1:0] BIAS_57_2;
wire [18*N_adder_tree-1:0] BIAS_57_3;
wire [18*N_adder_tree-1:0] BIAS_57_4;
wire [18*N_adder_tree-1:0] BIAS_58_1;
wire [18*N_adder_tree-1:0] BIAS_58_2;
wire [18*N_adder_tree-1:0] BIAS_58_3;
wire [18*N_adder_tree-1:0] BIAS_58_4;
wire [18*N_adder_tree-1:0] BIAS_59_1;
wire [18*N_adder_tree-1:0] BIAS_59_2;
wire [18*N_adder_tree-1:0] BIAS_59_3;
wire [18*N_adder_tree-1:0] BIAS_59_4;
wire [18*N_adder_tree-1:0] BIAS_59_5;
wire [18*N_adder_tree-1:0] BIAS_59_6;
wire [18*N_adder_tree-1:0] BIAS_59_7;
wire [18*N_adder_tree-1:0] BIAS_59_8;
					   
wire [18*N_adder_tree-1:0] BIAS_55;
wire [18*N_adder_tree-1:0] BIAS_56;
wire [18*N_adder_tree-1:0] BIAS_57;
wire [18*N_adder_tree-1:0] BIAS_58;
wire [18*N_adder_tree-1:0] BIAS_59;


BIAS_layer16_55_1 #(N_adder_tree) BIAS_layer16_55_1 (BIAS_55_1);
BIAS_layer16_55_2 #(N_adder_tree) BIAS_layer16_55_2 (BIAS_55_2);
BIAS_layer16_55_3 #(N_adder_tree) BIAS_layer16_55_3 (BIAS_55_3);
BIAS_layer16_55_4 #(N_adder_tree) BIAS_layer16_55_4 (BIAS_55_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS55 (BIAS_55_1,BIAS_55_2,BIAS_55_3,BIAS_55_4,BIAS_55,z);

BIAS_layer16_56_1 #(N_adder_tree) BIAS_layer16_56_1 (BIAS_56_1);
BIAS_layer16_56_2 #(N_adder_tree) BIAS_layer16_56_2 (BIAS_56_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS56 (BIAS_56_2,BIAS_56_1,BIAS_56,z);

BIAS_layer16_57_1 #(N_adder_tree) BIAS_layer16_57_1 (BIAS_57_1);
BIAS_layer16_57_2 #(N_adder_tree) BIAS_layer16_57_2 (BIAS_57_2);
BIAS_layer16_57_3 #(N_adder_tree) BIAS_layer16_57_3 (BIAS_57_3);
BIAS_layer16_57_4 #(N_adder_tree) BIAS_layer16_57_4 (BIAS_57_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS57 (BIAS_57_1,BIAS_57_2,BIAS_57_3,BIAS_57_4,BIAS_57,z);


BIAS_layer16_58_1 #(N_adder_tree) BIAS_layer16_58_1 (BIAS_58_1);
BIAS_layer16_58_2 #(N_adder_tree) BIAS_layer16_58_2 (BIAS_58_2);
BIAS_layer16_58_3 #(N_adder_tree) BIAS_layer16_58_3 (BIAS_58_3);
BIAS_layer16_58_4 #(N_adder_tree) BIAS_layer16_58_4 (BIAS_58_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS58 (BIAS_58_1,BIAS_58_2,BIAS_58_3,BIAS_58_4,BIAS_58,z);

BIAS_layer16_59_1 #(N_adder_tree) BIAS_layer16_59_1 (BIAS_59_1);
BIAS_layer16_59_2 #(N_adder_tree) BIAS_layer16_59_2 (BIAS_59_2);
BIAS_layer16_59_3 #(N_adder_tree) BIAS_layer16_59_3 (BIAS_59_3);
BIAS_layer16_59_4 #(N_adder_tree) BIAS_layer16_59_4 (BIAS_59_4);
BIAS_layer16_59_5 #(N_adder_tree) BIAS_layer16_59_5 (BIAS_59_5);
BIAS_layer16_59_6 #(N_adder_tree) BIAS_layer16_59_6 (BIAS_59_6);
BIAS_layer16_59_7 #(N_adder_tree) BIAS_layer16_59_7 (BIAS_59_7);
BIAS_layer16_59_8 #(N_adder_tree) BIAS_layer16_59_8 (BIAS_59_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS59 (BIAS_59_8,BIAS_59_1,BIAS_59_2,BIAS_59_3,BIAS_59_4,BIAS_59_5,BIAS_59_6,BIAS_59_7,BIAS_59,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS16 (BIAS_55,BIAS_56,BIAS_57,BIAS_58,BIAS_59,288'b0,288'b0,288'b0,bias,u);

endmodule