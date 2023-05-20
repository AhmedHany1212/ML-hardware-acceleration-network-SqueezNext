
module STALL_Controller(GATED_CLK_L1,GATED_CLK_L2,GATED_CLK_L3,GATED_CLK_L4,GATED_CLK_L5,GATED_CLK_L6,GATED_CLK_L7,GATED_CLK_L8,GATED_CLK_L9,
						clk,rst,Reg_ld1_L1,temp_zero_L1,temp_zero_L2,BRAM1_addr_L2,L_L2,
						temp_zero_L3,Reg_ld1_L3,temp_zero_L4,BRAM1_addr_L3,temp_zero_L5,
						Reg_ld1_L4,BRAM2_addr_L4,temp_zero_L6,BRAM2_addr_L5,BRAM1_addr_L5,temp_zero_L7,BRAM2_addr_L6,BRAM2_addr_L7,temp_zero_L8,u_L7,BRAM2_addr_L8,u_L8,temp_zero_L9);
						
input wire clk,rst;
input wire temp_zero_L1,temp_zero_L2,temp_zero_L3,temp_zero_L4,temp_zero_L5,temp_zero_L6,temp_zero_L7,temp_zero_L8,temp_zero_L9;
input wire [9:0] BRAM1_addr_L2,BRAM1_addr_L3,BRAM2_addr_L4,BRAM1_addr_L5,BRAM2_addr_L5,BRAM2_addr_L6,BRAM2_addr_L7,BRAM2_addr_L8;
input wire Reg_ld1_L1,Reg_ld1_L3,Reg_ld1_L4;
input wire [2:0] L_L2,u_L7,u_L8;

output wire GATED_CLK_L1,GATED_CLK_L2,GATED_CLK_L3,GATED_CLK_L4,GATED_CLK_L5,GATED_CLK_L6,GATED_CLK_L7,GATED_CLK_L8,GATED_CLK_L9;
/*
L1
FREEZE: temp_zero_L1
START: 	before the end of L2 by 13 clk(BRAM1_addr_L2==956 &&L==7)
L2
FREEZE: temp_zero_L2
START: 	Reg_ld1_L1
L3
FREEZE: temp_zero_L3
START: 	after 17+(12-8)*899clk from begin of L2(L==1 &&BRAM1_addr_L2=321)
L4
FREEZE: temp_zero_L4
START: 	Reg_wr_L3,b
L5
FREEZE: temp_zero_L5
START: 	Reg_wr_L4,b
L6
FREEZE: temp_zero_L6
START: 	after 17+(12-8)*899clk from begin of L2(BRAM1_addr_L5==321&&BRAM2_addr_L5==320)
L7
FREEZE: temp_zero_L7
START: clks=4503

L8
FREEZE: temp_zero_L8
START: BRAM2_addr_L7==529
L9
FREEZE: temp_zero_L9
START: BRAM2_addr_L8==529

L10
FREEZE: temp_zero_L10
START: temp_zero_L9

*/

CLK_GATE_L1 CLK_GATE_L1 (BRAM1_addr_L2==956&&L_L2==7,temp_zero_L1,clk,rst,GATED_CLK_L1);
CLK_GATE_L2 CLK_GATE_L2 (Reg_ld1_L1,temp_zero_L2,clk,rst,GATED_CLK_L2);
CLK_GATE_L2 CLK_GATE_L3 (BRAM1_addr_L2==321 &&L_L2==1,temp_zero_L3,clk,rst,GATED_CLK_L3);
CLK_GATE_L2 CLK_GATE_L4 (Reg_ld1_L3&&BRAM1_addr_L3==2,temp_zero_L4,clk,rst,GATED_CLK_L4);
CLK_GATE_L2 CLK_GATE_L5 (Reg_ld1_L4&&BRAM2_addr_L4==32,temp_zero_L5,clk,rst,GATED_CLK_L5);
CLK_GATE_L2 CLK_GATE_L6 (BRAM1_addr_L5==321&&BRAM2_addr_L5==320,temp_zero_L6,clk,rst,GATED_CLK_L6);
CLK_GATE_L2 CLK_GATE_L7 (BRAM2_addr_L6==310,temp_zero_L7,clk,rst,GATED_CLK_L7);
CLK_GATE_L2 CLK_GATE_L8 (BRAM2_addr_L7==529&&u_L7==5,temp_zero_L8,clk,rst,GATED_CLK_L8);
CLK_GATE_L2 CLK_GATE_L9 (BRAM2_addr_L8==529&&u_L8==4,temp_zero_L9,clk,rst,GATED_CLK_L9);
//CLK_GATE_L2 CLK_GATE_L10 (BRAM2_addr_L9_1==785&&u_L9==5,temp_zero_L10,clk,rst,GATED_CLK_L10);
endmodule