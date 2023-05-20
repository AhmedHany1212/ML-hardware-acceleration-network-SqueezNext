module BIAS_layer17#(parameter N_adder_tree=16)(bias,z,u);
input wire  [2:0] 				u ;
input wire  [3:0] 				z ;  
output wire [18*N_adder_tree-1:0] bias;


wire [18*N_adder_tree-1:0] BIAS_60_1;
wire [18*N_adder_tree-1:0] BIAS_60_2;
wire [18*N_adder_tree-1:0] BIAS_60_3;
wire [18*N_adder_tree-1:0] BIAS_60_4;
wire [18*N_adder_tree-1:0] BIAS_60_5;
wire [18*N_adder_tree-1:0] BIAS_60_6;
wire [18*N_adder_tree-1:0] BIAS_60_7;
wire [18*N_adder_tree-1:0] BIAS_60_8;
wire [18*N_adder_tree-1:0] BIAS_60_9;
wire [18*N_adder_tree-1:0] BIAS_60_10;
wire [18*N_adder_tree-1:0] BIAS_60_11;
wire [18*N_adder_tree-1:0] BIAS_60_12;
wire [18*N_adder_tree-1:0] BIAS_60_13;
wire [18*N_adder_tree-1:0] BIAS_60_14;
wire [18*N_adder_tree-1:0] BIAS_60_15;
wire [18*N_adder_tree-1:0] BIAS_60_16;

wire [18*N_adder_tree-1:0] BIAS_61_1;
wire [18*N_adder_tree-1:0] BIAS_61_2;
wire [18*N_adder_tree-1:0] BIAS_61_3;
wire [18*N_adder_tree-1:0] BIAS_61_4;
wire [18*N_adder_tree-1:0] BIAS_61_5;
wire [18*N_adder_tree-1:0] BIAS_61_6;
wire [18*N_adder_tree-1:0] BIAS_61_7;
wire [18*N_adder_tree-1:0] BIAS_61_8;

wire [18*N_adder_tree-1:0] BIAS_62_1;
wire [18*N_adder_tree-1:0] BIAS_62_2;
wire [18*N_adder_tree-1:0] BIAS_62_3;
wire [18*N_adder_tree-1:0] BIAS_62_4;

wire [18*N_adder_tree-1:0] BIAS_63_1;
wire [18*N_adder_tree-1:0] BIAS_63_2;
wire [18*N_adder_tree-1:0] BIAS_63_3;
wire [18*N_adder_tree-1:0] BIAS_63_4;
wire [18*N_adder_tree-1:0] BIAS_63_5;
wire [18*N_adder_tree-1:0] BIAS_63_6;
wire [18*N_adder_tree-1:0] BIAS_63_7;
wire [18*N_adder_tree-1:0] BIAS_63_8;


wire [18*N_adder_tree-1:0] BIAS_64_1;
wire [18*N_adder_tree-1:0] BIAS_64_2;
wire [18*N_adder_tree-1:0] BIAS_64_3;
wire [18*N_adder_tree-1:0] BIAS_64_4;
wire [18*N_adder_tree-1:0] BIAS_64_5;
wire [18*N_adder_tree-1:0] BIAS_64_6;
wire [18*N_adder_tree-1:0] BIAS_64_7;
wire [18*N_adder_tree-1:0] BIAS_64_8;

wire [18*N_adder_tree-1:0] BIAS_65_1;
wire [18*N_adder_tree-1:0] BIAS_65_2;
wire [18*N_adder_tree-1:0] BIAS_65_3;
wire [18*N_adder_tree-1:0] BIAS_65_4;
wire [18*N_adder_tree-1:0] BIAS_65_5;
wire [18*N_adder_tree-1:0] BIAS_65_6;
wire [18*N_adder_tree-1:0] BIAS_65_7;
wire [18*N_adder_tree-1:0] BIAS_65_8;
wire [18*N_adder_tree-1:0] BIAS_65_9;
wire [18*N_adder_tree-1:0] BIAS_65_10;
wire [18*N_adder_tree-1:0] BIAS_65_11;
wire [18*N_adder_tree-1:0] BIAS_65_12;
wire [18*N_adder_tree-1:0] BIAS_65_13;
wire [18*N_adder_tree-1:0] BIAS_65_14;
wire [18*N_adder_tree-1:0] BIAS_65_15;
wire [18*N_adder_tree-1:0] BIAS_65_16;
					   
wire [18*N_adder_tree-1:0] BIAS_60;
wire [18*N_adder_tree-1:0] BIAS_61;
wire [18*N_adder_tree-1:0] BIAS_62;
wire [18*N_adder_tree-1:0] BIAS_63;
wire [18*N_adder_tree-1:0] BIAS_64;
wire [18*N_adder_tree-1:0] BIAS_65;


BIAS_layer17_60_1  #(N_adder_tree) BIAS_layer17_60_1 (BIAS_60_1);
BIAS_layer17_60_2  #(N_adder_tree) BIAS_layer17_60_2 (BIAS_60_2);
BIAS_layer17_60_3  #(N_adder_tree) BIAS_layer17_60_3 (BIAS_60_3);
BIAS_layer17_60_4  #(N_adder_tree) BIAS_layer17_60_4 (BIAS_60_4);
BIAS_layer17_60_5  #(N_adder_tree) BIAS_layer17_60_5 (BIAS_60_5);
BIAS_layer17_60_6  #(N_adder_tree) BIAS_layer17_60_6 (BIAS_60_6);
BIAS_layer17_60_7  #(N_adder_tree) BIAS_layer17_60_7 (BIAS_60_7);
BIAS_layer17_60_8  #(N_adder_tree) BIAS_layer17_60_8 (BIAS_60_8);
BIAS_layer17_60_9  #(N_adder_tree) BIAS_layer17_60_9 (BIAS_60_9);
BIAS_layer17_60_10 #(N_adder_tree) BIAS_layer17_60_10 (BIAS_60_10);
BIAS_layer17_60_11 #(N_adder_tree) BIAS_layer17_60_11 (BIAS_60_11);
BIAS_layer17_60_12 #(N_adder_tree) BIAS_layer17_60_12 (BIAS_60_12);
BIAS_layer17_60_13 #(N_adder_tree) BIAS_layer17_60_13 (BIAS_60_13);
BIAS_layer17_60_14 #(N_adder_tree) BIAS_layer17_60_14 (BIAS_60_14);
BIAS_layer17_60_15 #(N_adder_tree) BIAS_layer17_60_15 (BIAS_60_15);
BIAS_layer17_60_16 #(N_adder_tree) BIAS_layer17_60_16 (BIAS_60_16);
mux_16_1_L17 #( N_adder_tree) mux_16_1_L17_BIAS_layer17_60(BIAS_60_1,BIAS_60_2,BIAS_60_3,BIAS_60_4,BIAS_60_5,BIAS_60_6,BIAS_60_7,BIAS_60_8
								  ,BIAS_60_9,BIAS_60_10,BIAS_60_11,BIAS_60_12,BIAS_60_13,BIAS_60_14,BIAS_60_15,BIAS_60_16,BIAS_60,z);

BIAS_layer17_61_1  #(N_adder_tree) BIAS_layer17_61_1 (BIAS_61_1);
BIAS_layer17_61_2  #(N_adder_tree) BIAS_layer17_61_2 (BIAS_61_2);
BIAS_layer17_61_3  #(N_adder_tree) BIAS_layer17_61_3 (BIAS_61_3);
BIAS_layer17_61_4  #(N_adder_tree) BIAS_layer17_61_4 (BIAS_61_4);
BIAS_layer17_61_5  #(N_adder_tree) BIAS_layer17_61_5 (BIAS_61_5);
BIAS_layer17_61_6  #(N_adder_tree) BIAS_layer17_61_6 (BIAS_61_6);
BIAS_layer17_61_7  #(N_adder_tree) BIAS_layer17_61_7 (BIAS_61_7);
BIAS_layer17_61_8  #(N_adder_tree) BIAS_layer17_61_8 (BIAS_61_8);
mux_8_1_L17 #( N_adder_tree) mux_8_1_L17_BIAS_layer17_61(BIAS_61_1,BIAS_61_2,BIAS_61_3,BIAS_61_4,BIAS_61_5,BIAS_61_6,BIAS_61_7,BIAS_61_8,BIAS_61,{z[2],z[1],z[0]});

BIAS_layer17_62_1  #(N_adder_tree) BIAS_layer17_62_1 (BIAS_62_1);
BIAS_layer17_62_2  #(N_adder_tree) BIAS_layer17_62_2 (BIAS_62_2);
BIAS_layer17_62_3  #(N_adder_tree) BIAS_layer17_62_3 (BIAS_62_3);
BIAS_layer17_62_4  #(N_adder_tree) BIAS_layer17_62_4 (BIAS_62_4);
mux_4_1_L17 #( N_adder_tree) mux_4_1_L17(BIAS_62_1,BIAS_62_2,BIAS_62_3,BIAS_62_4,BIAS_62,{z[1],z[0]});

BIAS_layer17_63_1  #(N_adder_tree) BIAS_layer17_63_1 (BIAS_63_1);
BIAS_layer17_63_2  #(N_adder_tree) BIAS_layer17_63_2 (BIAS_63_2);
BIAS_layer17_63_3  #(N_adder_tree) BIAS_layer17_63_3 (BIAS_63_3);
BIAS_layer17_63_4  #(N_adder_tree) BIAS_layer17_63_4 (BIAS_63_4);
BIAS_layer17_63_5  #(N_adder_tree) BIAS_layer17_63_5 (BIAS_63_5);
BIAS_layer17_63_6  #(N_adder_tree) BIAS_layer17_63_6 (BIAS_63_6);
BIAS_layer17_63_7  #(N_adder_tree) BIAS_layer17_63_7 (BIAS_63_7);
BIAS_layer17_63_8  #(N_adder_tree) BIAS_layer17_63_8 (BIAS_63_8);
mux_8_1_L17 #( N_adder_tree) mux_8_1_L17_BIAS_layer17_63(BIAS_63_1,BIAS_63_2,BIAS_63_3,BIAS_63_4,BIAS_63_5,BIAS_63_6,BIAS_63_7,BIAS_63_8,BIAS_63,{z[2],z[1],z[0]});


BIAS_layer17_64_1  #(N_adder_tree) BIAS_layer17_64_1 (BIAS_64_1);
BIAS_layer17_64_2  #(N_adder_tree) BIAS_layer17_64_2 (BIAS_64_2);
BIAS_layer17_64_3  #(N_adder_tree) BIAS_layer17_64_3 (BIAS_64_3);
BIAS_layer17_64_4  #(N_adder_tree) BIAS_layer17_64_4 (BIAS_64_4);
BIAS_layer17_64_5  #(N_adder_tree) BIAS_layer17_64_5 (BIAS_64_5);
BIAS_layer17_64_6  #(N_adder_tree) BIAS_layer17_64_6 (BIAS_64_6);
BIAS_layer17_64_7  #(N_adder_tree) BIAS_layer17_64_7 (BIAS_64_7);
BIAS_layer17_64_8  #(N_adder_tree) BIAS_layer17_64_8 (BIAS_64_8);
mux_8_1_L17 #( N_adder_tree) mux_8_1_L17_BIAS_layer17_64(BIAS_64_1,BIAS_64_2,BIAS_64_3,BIAS_64_4,BIAS_64_5,BIAS_64_6,BIAS_64_7,BIAS_64_8,BIAS_64,{z[2],z[1],z[0]});

BIAS_layer17_65_1  #(N_adder_tree) BIAS_layer17_65_1  (BIAS_65_1);
BIAS_layer17_65_2  #(N_adder_tree) BIAS_layer17_65_2  (BIAS_65_2);
BIAS_layer17_65_3  #(N_adder_tree) BIAS_layer17_65_3  (BIAS_65_3);
BIAS_layer17_65_4  #(N_adder_tree) BIAS_layer17_65_4  (BIAS_65_4);
BIAS_layer17_65_5  #(N_adder_tree) BIAS_layer17_65_5  (BIAS_65_5);
BIAS_layer17_65_6  #(N_adder_tree) BIAS_layer17_65_6  (BIAS_65_6);
BIAS_layer17_65_7  #(N_adder_tree) BIAS_layer17_65_7  (BIAS_65_7);
BIAS_layer17_65_8  #(N_adder_tree) BIAS_layer17_65_8  (BIAS_65_8);
BIAS_layer17_65_9  #(N_adder_tree) BIAS_layer17_65_9  (BIAS_65_9);
BIAS_layer17_65_10 #(N_adder_tree) BIAS_layer17_65_10 (BIAS_65_10);
BIAS_layer17_65_11 #(N_adder_tree) BIAS_layer17_65_11 (BIAS_65_11);
BIAS_layer17_65_12 #(N_adder_tree) BIAS_layer17_65_12 (BIAS_65_12);
BIAS_layer17_65_13 #(N_adder_tree) BIAS_layer17_65_13 (BIAS_65_13);
BIAS_layer17_65_14 #(N_adder_tree) BIAS_layer17_65_14 (BIAS_65_14);
BIAS_layer17_65_15 #(N_adder_tree) BIAS_layer17_65_15 (BIAS_65_15);
BIAS_layer17_65_16 #(N_adder_tree) BIAS_layer17_65_16 (BIAS_65_16);
mux_16_1_L17 #( N_adder_tree) mux_16_1_L17_BIAS_layer17_65(BIAS_65_1,BIAS_65_2,BIAS_65_3,BIAS_65_4,BIAS_65_5,BIAS_65_6,BIAS_65_7,BIAS_65_8
								  ,BIAS_65_9,BIAS_65_10,BIAS_65_11,BIAS_65_12,BIAS_65_13,BIAS_65_14,BIAS_65_15,BIAS_65_16,BIAS_65,z);

mux_8_1_L17 #( N_adder_tree) mux_8_1_L17_bias(BIAS_60,BIAS_61,BIAS_62,BIAS_63,BIAS_64,BIAS_65,288'b0,288'b0,bias,u);


endmodule