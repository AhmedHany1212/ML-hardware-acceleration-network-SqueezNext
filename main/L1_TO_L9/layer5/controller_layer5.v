module controller_layer5(L,z,j_Reg,x_Reg,BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,temp_zero_new,temp_zero);
input wire clk,rst;
output wire  L,temp_zero_new;
output wire [1:0] j_Reg;
wire [2:0] R;
output wire [4:0] x_Reg;
output wire [9:0] BRAM1_addr,BRAM2_addr;
output wire [3:0] weight_addr;
output wire 		load,z,temp_zero;
wire [1:0] j;
wire [4:0] row,col;
wire L_zero,z_zero,j_zero,y_zero,x_zero,temp_count;
wire [4:0] x,y;
L_counter L_counter_layer_5 		(L,L_zero,clk,rst,temp_zero);
j_counter j_counter_layer_5		(j,j_zero,clk,rst,L_zero,temp_zero);
z_counter Z_counter_layer_5 		(z,z_zero,clk,rst,j_zero,temp_zero);
y_counter y_counter_layer_5 		(y,y_zero,clk,rst,z_zero,temp_count,temp_zero);
x_counter x_counter_layer_5 		(x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
temp_counter temp_counter_layer_5(temp_count,temp_zero,clk,rst,x_zero,temp_zero_new);
R_counter R_counter_layer_5		(R,R_zero,clk,rst,j_zero,temp_zero);
Reg_x Reg_x								(x_Reg,clk,rst,x);
Reg_j	Reg_j								(j_Reg,clk,rst,j);
BRAM2_out BRAM2_out					(BRAM2_addr,clk,rst,z,R,x,y);
assign load=R_zero;
assign weight_addr={z,j,L};
assign row=x+j-1'b1;
assign col=y;
assign BRAM1_addr = {row,col};
endmodule