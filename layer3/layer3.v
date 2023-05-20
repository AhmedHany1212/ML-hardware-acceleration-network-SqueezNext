module layer3(clk,rst,temp_zero_L3,BRAM1_out,BRAM1_addr,BRAM2_addr,layer_out,Z_zero,WE_2);
parameter N_weight_out=16; //64filters * 3 inputs       ==  4*4
parameter N_BRAM1=16;  //3*(bram_size=32*32)              ==  16 ---4ØŸ
parameter N_adder_tree=4; //64filters                   ==  4 filters
parameter weight_addr_WIDTH=3;
parameter BRAM2_adder_width=10; 
 
input clk,rst;
input [16*4*N_adder_tree-1:0] BRAM1_out;

//output wire [N_adder_tree*16-1:0] BRAM2_out1,BRAM2_out2;
output wire [N_adder_tree*16-1:0]  			layer_out ;
output temp_zero_L3,WE_2,Z_zero;
output [9:0] BRAM1_addr,BRAM2_addr;
wire [16*N_adder_tree-1:0] BRAM1_out1,BRAM1_out2,BRAM1_out3,BRAM1_out4;
wire [1:0] L;
wire [2:0] weight_addr;
wire  [16*N_weight_out-1:0] weight_out;
wire [16*N_adder_tree-1:0] BRAM_out;
wire [18*N_adder_tree-1:0] bias1,bias2,bias;
wire       Z;

assign BRAM1_out1= BRAM1_out[16*4*1-1:0];
assign BRAM1_out2= BRAM1_out[16*4*2-1:16*4*1];
assign BRAM1_out3= BRAM1_out[16*4*3-1:16*4*2];
assign BRAM1_out4= BRAM1_out[16*4*4-1:16*4*3];


controller_layer3 controller_layer3(L,Z,BRAM1_addr,BRAM2_addr,weight_addr,clk,rst,Z_zero,temp_zero_L3,WE_2);
CONV4 #(N_weight_out,weight_addr_WIDTH) CONV4 (weight_addr,clk,weight_out);
mux4_1_Layer_3 mux4_1 (BRAM1_out1,BRAM1_out2,BRAM1_out3,BRAM1_out4,L,BRAM_out);
BIAS_layer3_1 #(N_adder_tree) BIAS_layer3_1 (bias1);
BIAS_layer3_2 #(N_adder_tree) BIAS_layer3_2 (bias2);
mux2_1_Layer_3 mux2_1  (bias1,bias2,Z,bias);
M_A_T4x4 #(N_adder_tree)    M_A_T4x4  (BRAM_out,clk,rst,weight_out,bias,L==3,layer_out);

//MEM_L3_2 #(N_adder_tree,BRAM2_adder_width) MEM_L3_2_1 (BRAM2_addr,clk,layer_out,Z_zero,BRAM2_out1);
//MEM_L3_2 #(N_adder_tree,BRAM2_adder_width) MEM_L3_2_2 (BRAM2_addr,clk,layer_out,(Z==0&&L==3)&&!({x,y}==0),BRAM2_out2);
endmodule














