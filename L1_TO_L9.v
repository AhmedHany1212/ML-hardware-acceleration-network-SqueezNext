module L1_TO_L9(clk,rst,condition_L10,BRAM2_out_L9,BRAM2_address_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2,u_L9,ld_L9);

parameter N_adder_tree_L1=64;
parameter N_adder_tree_L2=16;
parameter N_adder_tree_L3=4; 
parameter N_adder_tree_L4=8;
parameter N_adder_tree_L5=8;
parameter N_adder_tree_L6=4;
parameter N_adder_tree_L7=16;
parameter N_adder_tree_L8=16;
parameter N_bram_L9=16;
input clk,rst;
output condition_L10;
output [2:0] u_L9;
output ld_L9;
output [N_bram_L9*16-1:0] BRAM2_out_L9;
output [9:0]BRAM2_address_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2;
wire [N_adder_tree_L8*16-1:0] layer8_out;
wire [N_adder_tree_L8*16-1:0] BRAM2_out_L7;
wire [N_adder_tree_L6*16-1:0] BRAM2_out_L6,BRAM1_in_L7_1,BRAM1_in_L7_2,BRAM1_in_L7_3,BRAM1_in_L7_4;
wire [N_adder_tree_L2*16-1:0]  			AT_out_L2;
wire [N_adder_tree_L3*16-1:0]  			AT_out_L3;
wire [N_adder_tree_L2*16-1:0] SKIP_in_L6;
wire [2:0] L_L2;
wire [16*4*N_adder_tree_L3-1:0] BRAM1_in_L3;
wire [N_adder_tree_L1*16-1:0]     BRAM1_out_L1,BRAM_L2_in;
wire Reg_ld1_L1,ld1_L1,temp_zero_new,ld1_L2,z_L2,ld_L7,ld_L8;
wire [N_adder_tree_L3*16-1:0] BRAM1_in_L4_1,BRAM1_in_L4_2;
wire [N_adder_tree_L5*16-1:0] BRAM2_out_L5;
wire [N_adder_tree_L4*16-1:0]  BRAM1_in_L5_1,BRAM1_in_L5_2,BRAM2_out_L4,BRAM1_in_L6_1,BRAM1_in_L6_2;
wire x_first_bit_L2,y_first_bit_L2,temp_zero_new_L2,temp_zero_new_L6;
wire [2:0] z_L6,u_L7,u_L8;

wire [9:0] BRAM2_addr_L1,BRAM1_addr_L2,BRAM2_addr_L2,BRAM1_addr_L3,BRAM2_addr_L3,
		   BRAM1_addr_L4,BRAM2_addr_L4,BRAM1_addr_L5,BRAM1_addr_L6,BRAM2_addr_L5,
		   BRAM_skip_addr1_L2,BRAM_SKIP_addr_L6,BRAM2_addr_L6,BRAM1_addr_L7,BRAM2_addr_L7,BRAM2_addr_L8;
wire GATED_CLK_L1,GATED_CLK_L2,GATED_CLK_L3,GATED_CLK_L4,GATED_CLK_L5,GATED_CLK_L6,GATED_CLK_L7,GATED_CLK_L8,GATED_CLK_L9;
wire WE_L3_1,WE_L3_2;
wire WE_L4_1,WE_L4_2;
wire WE_L5_1,WE_L5_2;
wire WE_SKIP_L2;
wire temp_zero_L1,temp_zero_L2,temp_zero_L3,temp_zero_L4,temp_zero_L5,temp_zero_L6,temp_zero_L7,temp_zero_L8,temp_zero_L9;
///////////////////////////////////////////////////////////////////
STALL_Controller STALL_Controller(GATED_CLK_L1,GATED_CLK_L2,GATED_CLK_L3,GATED_CLK_L4,GATED_CLK_L5,GATED_CLK_L6,GATED_CLK_L7,GATED_CLK_L8,GATED_CLK_L9,
											clk,rst,Reg_ld1_L1,temp_zero_L1,temp_zero_L2,BRAM1_addr_L2,L_L2,
											temp_zero_L3,WE_L3_2,temp_zero_L4,BRAM1_addr_L3,temp_zero_L5,WE_L4_2,BRAM2_addr_L4,
											temp_zero_L6,BRAM2_addr_L5,BRAM1_addr_L5,temp_zero_L7,BRAM2_addr_L6,BRAM2_addr_L7,temp_zero_L8,u_L7,BRAM2_addr_L8,u_L8,temp_zero_L9);


layer1 layer1(GATED_CLK_L1,rst,BRAM1_out_L1,ld1_L1,temp_zero_L1,BRAM2_addr_L1,temp_zero_new);
Reg_AT_u_L2 Reg_ld_L1(ld1_L1,clk,rst,Reg_ld1_L1);
MEM_L2_L3 #(64,10) MEM_L1_L2 (BRAM2_addr_L1,BRAM1_addr_L2,clk,BRAM1_out_L1,ld1_L1&&!temp_zero_new,1'b1,BRAM_L2_in);
layer_2 layer_2(GATED_CLK_L2,rst,BRAM_L2_in,temp_zero_L2,BRAM1_addr_L2,L_L2,AT_out_L2,ld1_L2, z_L2,BRAM2_addr_L2,BRAM_skip_addr1_L2,x_first_bit_L2,y_first_bit_L2,temp_zero_new_L2,WE_SKIP_L2);
MEM_L2_L3 #(16,10) MEM_L2_L3(BRAM2_addr_L2,BRAM1_addr_L3,clk,AT_out_L2,ld1_L2&&((!z_L2&&!y_first_bit_L2)||x_first_bit_L2)&&!temp_zero_new_L2,1'b1,BRAM1_in_L3);
MEM_L2_L3 #(16,10) MEM_SKIP_L2_L6(BRAM_skip_addr1_L2,BRAM_SKIP_addr_L6,clk,AT_out_L2,WE_SKIP_L2,1'b1,SKIP_in_L6);

//meml2_2 #(M,addr_width) meml2_2(.addr(BRAM2_addr_L2),.clk(clk),.in_filter(out_layer),.wr(load_L2&&((!z&&!y_first_bit)||x_first_bit)&&!temp_zero_new),.out_filter(out_filter_2));

layer3 layer3(GATED_CLK_L3,rst,temp_zero_L3,BRAM1_in_L3,BRAM1_addr_L3,BRAM2_addr_L3,AT_out_L3,WE_L3_1,WE_L3_2);
MEM_L2_L3 #(4,10) MEM_L3_L4_1(BRAM2_addr_L3,BRAM1_addr_L4,clk,AT_out_L3,WE_L3_1,1'b1,BRAM1_in_L4_1);
MEM_L2_L3 #(4,10) MEM_L3_L4_2(BRAM2_addr_L3,BRAM1_addr_L4,clk,AT_out_L3,WE_L3_2,1'b1,BRAM1_in_L4_2);
layer4 layer4(GATED_CLK_L4,rst,BRAM1_in_L4_1,BRAM1_in_L4_2,BRAM2_out_L4,temp_zero_L4,BRAM1_addr_L4,BRAM2_addr_L4,WE_L4_1,WE_L4_2);
MEM_L2_L3 #(8,10) MEM_L4_L5_1(BRAM2_addr_L4,BRAM1_addr_L5,clk,BRAM2_out_L4,WE_L4_1,1'b1,BRAM1_in_L5_1);
MEM_L2_L3 #(8,10) MEM_L4_L5_2(BRAM2_addr_L4,BRAM1_addr_L5,clk,BRAM2_out_L4,WE_L4_2,1'b1,BRAM1_in_L5_2);
layer5 layer5 (GATED_CLK_L5,rst,BRAM1_in_L5_1,BRAM1_in_L5_2,BRAM1_addr_L5,BRAM2_addr_L5,BRAM2_out_L5,temp_zero_L5,WE_L5_1,WE_L5_2);
MEM_L2_L3 #(8,10) MEM_L5_L6_1(BRAM2_addr_L5,BRAM1_addr_L6,clk,BRAM2_out_L5,WE_L5_1,1'b1,BRAM1_in_L6_1);
MEM_L2_L3 #(8,10) MEM_L5_L6_2(BRAM2_addr_L5,BRAM1_addr_L6,clk,BRAM2_out_L5,WE_L5_2,1'b1,BRAM1_in_L6_2);
layer6 layer6 (GATED_CLK_L6,rst,{BRAM1_in_L6_2,BRAM1_in_L6_1},SKIP_in_L6,BRAM_SKIP_addr_L6,BRAM1_addr_L6,BRAM2_addr_L6,temp_zero_L6,z_L6,BRAM2_out_L6,temp_zero_new_L6);
MEM_L2_L3 #(4,10) MEM_L6_L7_1(BRAM2_addr_L6,BRAM1_addr_L7,clk,BRAM2_out_L6,(z_L6==1||z_L6==5)&& !temp_zero_new_L6,1'b1,BRAM1_in_L7_1);
MEM_L2_L3 #(4,10) MEM_L6_L7_2(BRAM2_addr_L6,BRAM1_addr_L7,clk,BRAM2_out_L6,(z_L6==2||z_L6==6)&& !temp_zero_new_L6,1'b1,BRAM1_in_L7_2);
MEM_L2_L3 #(4,10) MEM_L6_L7_3(BRAM2_addr_L6,BRAM1_addr_L7,clk,BRAM2_out_L6,(z_L6==3||z_L6==7)&& !temp_zero_new_L6,1'b1,BRAM1_in_L7_3);
MEM_L2_L3 #(4,10) MEM_L6_L7_4(BRAM2_addr_L6,BRAM1_addr_L7,clk,BRAM2_out_L6,(z_L6==0||z_L6==4)&& !temp_zero_new_L6,1'b1,BRAM1_in_L7_4);
layer7 layer7(GATED_CLK_L7,rst,{BRAM1_in_L7_4,BRAM1_in_L7_3,BRAM1_in_L7_2,BRAM1_in_L7_1},BRAM1_addr_L7,BRAM2_out_L7,u_L7,BRAM2_addr_L7,temp_zero_L7,ld_L7);                                              
layer8 layer8(GATED_CLK_L8,rst,clk,BRAM2_out_L7,u_L7,BRAM2_addr_L7,BRAM2_addr_L8,temp_zero_L8,layer8_out,ld_L7,u_L8,ld_L8);

layer9 layer9(GATED_CLK_L9,rst,clk,BRAM2_addr_L8,layer8_out,temp_zero_L9,u_L8,ld_L8,BRAM2_out_L9,u_L9,ld_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2,BRAM2_address_out_L9,condition_L10);

//layer10 layer10(GATED_CLK_L10,rst,clk,BRAM2_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2,BRAM2_address_out_L9,u_L9,ld_L9,temp_zero_L10);


endmodule

















