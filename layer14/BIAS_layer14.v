module BIAS_layer14#(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				z,u ; 
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_45_1;
wire [18*N_adder_tree-1:0] BIAS_45_2;
wire [18*N_adder_tree-1:0] BIAS_45_3;
wire [18*N_adder_tree-1:0] BIAS_45_4;
wire [18*N_adder_tree-1:0] BIAS_46_1;
wire [18*N_adder_tree-1:0] BIAS_46_2;
wire [18*N_adder_tree-1:0] BIAS_47_1;
wire [18*N_adder_tree-1:0] BIAS_47_2;
wire [18*N_adder_tree-1:0] BIAS_47_3;
wire [18*N_adder_tree-1:0] BIAS_47_4;
wire [18*N_adder_tree-1:0] BIAS_48_1;
wire [18*N_adder_tree-1:0] BIAS_48_2;
wire [18*N_adder_tree-1:0] BIAS_48_3;
wire [18*N_adder_tree-1:0] BIAS_48_4;
wire [18*N_adder_tree-1:0] BIAS_49_1;
wire [18*N_adder_tree-1:0] BIAS_49_2;
wire [18*N_adder_tree-1:0] BIAS_49_3;
wire [18*N_adder_tree-1:0] BIAS_49_4;
wire [18*N_adder_tree-1:0] BIAS_49_5;
wire [18*N_adder_tree-1:0] BIAS_49_6;
wire [18*N_adder_tree-1:0] BIAS_49_7;
wire [18*N_adder_tree-1:0] BIAS_49_8;
					   
wire [18*N_adder_tree-1:0] BIAS_45;
wire [18*N_adder_tree-1:0] BIAS_46;
wire [18*N_adder_tree-1:0] BIAS_47;
wire [18*N_adder_tree-1:0] BIAS_48;
wire [18*N_adder_tree-1:0] BIAS_49;


BIAS_layer14_45_1 #(N_adder_tree) BIAS_layer14_45_1 (BIAS_45_1);
BIAS_layer14_45_2 #(N_adder_tree) BIAS_layer14_45_2 (BIAS_45_2);
BIAS_layer14_45_3 #(N_adder_tree) BIAS_layer14_45_3 (BIAS_45_3);
BIAS_layer14_45_4 #(N_adder_tree) BIAS_layer14_45_4 (BIAS_45_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS45 (BIAS_45_1,BIAS_45_2,BIAS_45_3,BIAS_45_4,BIAS_45,z);

BIAS_layer14_46_1 #(N_adder_tree) BIAS_layer14_46_1 (BIAS_46_1);
BIAS_layer14_46_2 #(N_adder_tree) BIAS_layer14_46_2 (BIAS_46_2);
mux_2_1 #(N_adder_tree) mux_2_1_BIAS46 (BIAS_46_2,BIAS_46_1,BIAS_46,z);

BIAS_layer14_47_1 #(N_adder_tree) BIAS_layer14_47_1 (BIAS_47_1);
BIAS_layer14_47_2 #(N_adder_tree) BIAS_layer14_47_2 (BIAS_47_2);
BIAS_layer14_47_3 #(N_adder_tree) BIAS_layer14_47_3 (BIAS_47_3);
BIAS_layer14_47_4 #(N_adder_tree) BIAS_layer14_47_4 (BIAS_47_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS47 (BIAS_47_1,BIAS_47_2,BIAS_47_3,BIAS_47_4,BIAS_47,z);


BIAS_layer14_48_1 #(N_adder_tree) BIAS_layer14_48_1 (BIAS_48_1);
BIAS_layer14_48_2 #(N_adder_tree) BIAS_layer14_48_2 (BIAS_48_2);
BIAS_layer14_48_3 #(N_adder_tree) BIAS_layer14_48_3 (BIAS_48_3);
BIAS_layer14_48_4 #(N_adder_tree) BIAS_layer14_48_4 (BIAS_48_4);
mux_4_1 #(N_adder_tree) mux_4_1_BIAS48 (BIAS_48_1,BIAS_48_2,BIAS_48_3,BIAS_48_4,BIAS_48,z);

BIAS_layer14_49_1 #(N_adder_tree) BIAS_layer14_49_1 (BIAS_49_1);
BIAS_layer14_49_2 #(N_adder_tree) BIAS_layer14_49_2 (BIAS_49_2);
BIAS_layer14_49_3 #(N_adder_tree) BIAS_layer14_49_3 (BIAS_49_3);
BIAS_layer14_49_4 #(N_adder_tree) BIAS_layer14_49_4 (BIAS_49_4);
BIAS_layer14_49_5 #(N_adder_tree) BIAS_layer14_49_5 (BIAS_49_5);
BIAS_layer14_49_6 #(N_adder_tree) BIAS_layer14_49_6 (BIAS_49_6);
BIAS_layer14_49_7 #(N_adder_tree) BIAS_layer14_49_7 (BIAS_49_7);
BIAS_layer14_49_8 #(N_adder_tree) BIAS_layer14_49_8 (BIAS_49_8);
mux_8_1 #(N_adder_tree) mux_8_1_BIAS49 (BIAS_49_8,BIAS_49_1,BIAS_49_2,BIAS_49_3,BIAS_49_4,BIAS_49_5,BIAS_49_6,BIAS_49_7,BIAS_49,z);

mux_8_1 #(N_adder_tree) mux_8_1_BIAS14 (BIAS_45,BIAS_46,BIAS_47,BIAS_48,BIAS_49,288'b0,288'b0,288'b0,bias,u);

endmodule