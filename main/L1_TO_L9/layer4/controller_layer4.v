module controller_layer4(L,z,k_Reg,y_Reg,BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,temp_zero_new,temp_zero);
input wire clk,rst;
output wire  L;
output wire [1:0] k_Reg;
output wire [4:0] y_Reg;
output wire [9:0] BRAM1_addr,BRAM2_addr;
output wire [3:0] weight_addr;
output wire 		load,z,temp_zero_new,temp_zero;
 wire [1:0] k;
wire [4:0] row,col,x,y,x_Reg;
wire L_zero,y_zero,x_zero,temp_count,z_zero,K_zero;

L_counter_L4 L_counter_layer_4 		(L,L_zero,clk,rst,temp_zero);
k_counter_L4 k_counter_layer_4		(k,K_zero,clk,rst,L_zero,temp_zero);
z_counter_L4 Z_counter_layer_4 		(z,z_zero,clk,rst,K_zero,temp_zero);
y_counter_L4 y_counter_layer_4 		(y,y_zero,clk,rst,z_zero,temp_count,temp_zero);
x_counter_L4 x_counter_layer_4 		(x,x_zero,clk,rst,y_zero,temp_count,temp_zero);

Reg_y_L4 Reg_y								(y_Reg,clk,rst,y);
Reg_k_L4	Reg_k								(k_Reg,clk,rst,k);
temp_counter_L4 temp_counter_layer_4(temp_count,temp_zero,clk,rst,x_zero,temp_zero_new);
R_counter_L4 R_counter_layer_4		(R_zero,clk,rst,K_zero,temp_zero);
BRAM2_out_L4 BRAM2_out					(BRAM2_addr,clk,rst,K_zero,x,y);
assign load=R_zero;
assign weight_addr={z,k,L};
assign row=x;
assign col=y+k-1'b1;
assign BRAM1_addr = {row,col};
endmodule
