module L10_TO_L17(clk,rst,out1_layer17,out2_layer17,temp_zero_L9,BRAM_L10_in,BRAM1_addr_in_L9,BRAM1_addr_in_L9_1,BRAM1_addr_in_L9_2,u_L9,Ld_L9);
parameter adder_tree_L10_TO_L16 = 16;

input wire clk,rst;
input wire temp_zero_L9;
input wire [16*16-1:0]BRAM_L10_in;
input wire [9:0]BRAM1_addr_in_L9,BRAM1_addr_in_L9_1,BRAM1_addr_in_L9_2;
input wire [2:0] u_L9; 
input wire Ld_L9;
output wire [adder_tree_L10_TO_L16/2*16-1:0] out1_layer17,out2_layer17;
wire GATED_CLK_L10,GATED_CLK_L11,GATED_CLK_L12,GATED_CLK_L13,GATED_CLK_L14,GATED_CLK_L15,GATED_CLK_L16,GATED_CLK_L17;
wire [9:0] BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,BRAM_skip_addr1,BRAM_skip_addr2,BRAM1_address;
wire [9:0] TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2;
wire [4:0]weight_addr_conv1;
wire [2:0]weight_addr_conv2;
wire [4:0]weight_addr_conv3;
wire [5:0]weight_addr_conv4;
wire [4:0]weight_addr_conv5;
wire [2:0] u,z;
wire Reg_cond,Reg_cond2;
wire  load,temp_zero_new,padding,finish_layer,temp_zero_final_L17;
wire [6:0] flags;
wire WRITE,REG_WRITE;
wire [adder_tree_L10_TO_L16*16-1:0] BRAM2_out_L10,BRAM2_out_L11,BRAM2_out_L12,BRAM2_out_L13,BRAM2_out_L14,BRAM2_out_L15,BRAM2_out_L16,BRAM2_out_L17;
wire[8:0] counter;
assign out1_layer17=BRAM2_out_L17[127:0];
assign out2_layer17=BRAM2_out_L17[255:128];

STALL_Controller_L10 STALL_Controller_L10(clk,rst,GATED_CLK_L10,GATED_CLK_L11,GATED_CLK_L12,GATED_CLK_L13,
											 GATED_CLK_L14,GATED_CLK_L15,GATED_CLK_L16,GATED_CLK_L17,finish_layer,temp_zero_L9,flags,temp_zero_final_L17,Reg_cond2);

Reg_AT_u_L2 cond_Reg((counter==511)&&flags[6],clk,rst,Reg_cond);
Reg_AT_u_L2 cond_Reg2(Reg_cond,clk,rst,Reg_cond2);


START_L10_L16 START_L10_L16 (clk,rst,flags,temp_zero_L9);

CONTROL_L10_TO_L16 CONTROL_L10_TO_L16(BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,GATED_CLK_L10,rst,u,load,
												weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
												 temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,finish_layer,BRAM1_address);

//layer11 layer11();  //delay 10805
TRANS_ADDR TRANS_ADDR (finish_layer,clk,rst,TRANS_ADDR1,TRANS_ADDR2,WRITE,counter);
REG_TRANS_ADDR REG_TRANS_ADDR(clk,rst,TRANS_ADDR1,TRANS_ADDR2,WRITE,REG_TRANS_ADDR1,REG_TRANS_ADDR2,REG_WRITE);

layer10 layer10(GATED_CLK_L10,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_address,u,load,TRANS_ADDR1,TRANS_ADDR2,WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L10,
					BRAM_L10_in,BRAM1_addr_in_L9_1,BRAM1_addr_in_L9_2,BRAM1_addr_in_L9,u_L9,Ld_L9);

				
layer11 layer11(GATED_CLK_L11,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L10,BRAM2_out_L11);		
					
layer12 layer12(GATED_CLK_L12,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L11,BRAM2_out_L12);

layer13 layer13(GATED_CLK_L13,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L12,BRAM2_out_L13);

layer14 layer14(GATED_CLK_L14,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L13,BRAM2_out_L14);

layer15 layer15(GATED_CLK_L15,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L14,BRAM2_out_L15);

layer16 layer16(GATED_CLK_L16,clk,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
					weight_addr_conv1,weight_addr_conv2,weight_addr_conv3,weight_addr_conv4,weight_addr_conv5,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out_L15,BRAM2_out_L16);					

layer_17 layer_17(GATED_CLK_L17,clk,rst,WRITE,REG_WRITE,BRAM2_out_L16,REG_TRANS_ADDR1,REG_TRANS_ADDR2,BRAM2_out_L17,temp_zero_final_L17);

endmodule


