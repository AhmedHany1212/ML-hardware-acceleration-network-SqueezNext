module STALL_Controller_L10(clk,rst,GATED_CLK_L10,GATED_CLK_L11,GATED_CLK_L12,GATED_CLK_L13,GATED_CLK_L14,GATED_CLK_L15,GATED_CLK_L16,GATED_CLK_L17,finish_layer,temp_zero_L9,flags,temp_zero_final_L17,Reg_cond);
						
input wire clk,rst;
input wire finish_layer,temp_zero_L9,temp_zero_final_L17;
input wire [6:0] flags;
input wire Reg_cond;

output wire GATED_CLK_L10,GATED_CLK_L11,GATED_CLK_L12,GATED_CLK_L13,GATED_CLK_L14,GATED_CLK_L15,GATED_CLK_L16,GATED_CLK_L17;

//CLK_GATE_L2 CLK_GATE_L10_L16 (temp_zero_L9,finish_layer,clk,rst,GATED_CLK_L10_L16);
CLK_GATE_L2 CLK_GATE_L10 (temp_zero_L9,finish_layer,clk,rst,GATED_CLK_L10);
CLK_GATE_L2 CLK_GATE_L11 (temp_zero_L9&&flags[0],finish_layer,clk,rst,GATED_CLK_L11);
CLK_GATE_L2 CLK_GATE_L12 (temp_zero_L9&&flags[1],finish_layer,clk,rst,GATED_CLK_L12);
CLK_GATE_L2 CLK_GATE_L13 (temp_zero_L9&&flags[2],finish_layer,clk,rst,GATED_CLK_L13);
CLK_GATE_L2 CLK_GATE_L14 (temp_zero_L9&&flags[3],finish_layer,clk,rst,GATED_CLK_L14);
CLK_GATE_L2 CLK_GATE_L15 (temp_zero_L9&&flags[4],finish_layer,clk,rst,GATED_CLK_L15);
CLK_GATE_L2 CLK_GATE_L16 (temp_zero_L9&&flags[5],finish_layer,clk,rst,GATED_CLK_L16);
CLK_GATE_L2 CLK_GATE_L17 (Reg_cond,temp_zero_final_L17,clk,rst,GATED_CLK_L17);


endmodule

