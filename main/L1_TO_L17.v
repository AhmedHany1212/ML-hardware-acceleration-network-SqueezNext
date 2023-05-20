module L1_TO_L17(clk,rst,out1_layer17,out2_layer17);

parameter N_bram_L9=16;
parameter adder_tree_L10_TO_L16 = 16;

input wire clk,rst;
output wire [adder_tree_L10_TO_L16/2*16-1:0] out1_layer17,out2_layer17;

wire condition_L10;
wire [2:0] u_L9;
wire ld_L9;
wire [N_bram_L9*16-1:0] BRAM2_out_L9;
wire [9:0]BRAM2_address_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2;

L1_TO_L9 L1_TO_L9(clk,rst,condition_L10,BRAM2_out_L9,BRAM2_address_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2,u_L9,ld_L9);
L10_TO_L17 L10_TO_L17(clk,rst,out1_layer17,out2_layer17,condition_L10,BRAM2_out_L9,BRAM2_address_out_L9,BRAM2_addr_L9_1,BRAM2_addr_L9_2,u_L9,ld_L9);

endmodule
