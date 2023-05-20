
module layer_17(clk,clk_mem,rst,WRITE,REG_WRITE,INPUT_LAYER,REG_TRANS_ADDR1,REG_TRANS_ADDR2,BRAM_out_Mem2,temp_zero_final);

parameter N_weight_out=256;
parameter N_adder_tree=16;
parameter N_BRAM1=8;
output wire temp_zero_final;
output wire [N_adder_tree*16-1:0] BRAM_out_Mem2;
input wire [9:0]REG_TRANS_ADDR1,REG_TRANS_ADDR2;
input [N_adder_tree*16-1:0] INPUT_LAYER;
input wire clk,clk_mem,rst;
input 	   WRITE,REG_WRITE;
wire  [N_BRAM1*16-1:0] layer_input1,layer_input2;
wire [N_adder_tree*16-1:0] BRAM_skip_out;
wire [N_adder_tree/2*16-1:0] BRAM_skip_out1,BRAM_skip_out2;
wire  load,temp_zero_new,padding,temp_zero;
wire [2:0] u,u_Reg1,u_Reg5,u_Reg3;
wire [3:0] z;
wire [6:0]weight_addr_conv60_65;
wire [5:0]weight_addr_conv61;
wire [4:0]weight_addr_conv62;
wire [6:0]weight_addr_conv63;
wire [7:0]weight_addr_conv64;
//wire [6:0]weight_addr_conv65;
wire [9:0] BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,BRAM1_addr1_layer,BRAM1_addr2_layer;
wire [N_weight_out*16-1:0] weight_out_conv60,weight_out_conv61,weight_out_conv62,weight_out_conv63,weight_out_conv64,weight_out_conv65,weight_out;
wire [N_adder_tree*16-1:0] BRAM_out_Mem1,BRAM_out,BRAM_out_without_padding,adder_tree_out;
wire [N_adder_tree*18-1:0] bias;

wire [N_BRAM1*16-1:0] BRAM1_out1,BRAM1_out2,BRAM2_out1,BRAM2_out2,BRAM_in1,BRAM_in2,BRAM_in_1,BRAM_in_2;
assign temp_zero_final=temp_zero&&(u==5);
assign  BRAM_out_Mem1={BRAM1_out2,BRAM1_out1};
assign  BRAM_out_Mem2={BRAM2_out2,BRAM2_out1};
assign BRAM_skip_out={BRAM_skip_out2,BRAM_skip_out1};

assign BRAM_in_1=adder_tree_out[127:0];
assign BRAM_in_2=adder_tree_out[255:128];

assign layer_input1=INPUT_LAYER[127:0];
assign layer_input2=INPUT_LAYER[255:128];

assign BRAM1_addr1_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR1 : BRAM1_addr1;
assign BRAM1_addr2_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR2 : BRAM1_addr2;
assign BRAM_in1= (WRITE||REG_WRITE) ? layer_input1 : BRAM_in_1;
assign BRAM_in2= (WRITE||REG_WRITE) ? layer_input2 : BRAM_in_2;

cont_layer17  cont_layer17(clk,rst,u,load,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,weight_addr_conv60_65,weight_addr_conv61,weight_addr_conv62,weight_addr_conv63,weight_addr_conv64,temp_zero_new,padding,z,u_Reg1,u_Reg5,u_Reg3,temp_zero);

CONV60  CONV60 (weight_out_conv60,weight_addr_conv60_65,clk);
CONV61 CONV61 (weight_out_conv61,weight_addr_conv61,clk);
CONV62 CONV62 (weight_out_conv62,weight_addr_conv62,clk);
CONV63 CONV63 (weight_out_conv63,weight_addr_conv63,clk);
CONV64 CONV64 (weight_out_conv64,weight_addr_conv64,clk);
CONV65 CONV65 (weight_out_conv65,weight_addr_conv60_65,clk);
MUX_weight_6X1_L17  #(.N_weight_out(N_weight_out)) MUX_weight_6X1 (weight_out_conv60,weight_out_conv61,weight_out_conv62,weight_out_conv63,weight_out_conv64,weight_out_conv65,u_Reg1,weight_out);
MUX_BRAM_2X1_L17  #(.N_adder_tree(N_adder_tree)) MUX_BRAM_2X1 (BRAM_out_without_padding,BRAM_out_Mem1,BRAM_out_Mem2,u);
BRAM_layer17 #(.N_BRAM1(N_BRAM1)) MEM1 	 (BRAM1_out1,BRAM1_out2,BRAM_in1,BRAM_in2,BRAM1_addr1_layer,BRAM1_addr2_layer,(load&&(u==2||u==4))||WRITE||REG_WRITE,clk_mem);
BRAM_layer17 #(.N_BRAM1(N_BRAM1)) MEM2 	 (BRAM2_out1,BRAM2_out2,BRAM_in1,BRAM_in2,BRAM2_addr1,BRAM2_addr2,load&&(u_Reg5==1||u==3||u==5),clk_mem);
BRAM_layer17 #(.N_BRAM1(N_BRAM1)) MEM_skip (BRAM_skip_out1,BRAM_skip_out2,BRAM_in1,BRAM_in2,BRAM2_addr1,BRAM2_addr2,(load&&u_Reg5==0),clk_mem);
MUX_padding_2X1_L17  MUX_padding_2X1(BRAM_out,padding,BRAM_out_without_padding);
M_A_T16x16_L17  M_A_T16x16 (BRAM_out,clk,rst,weight_out,bias,load||temp_zero_new,adder_tree_out,BRAM_skip_out,u,u_Reg1);
BIAS_layer17 #(N_adder_tree) BIAS_layer17 (bias,z,u_Reg3);
endmodule
