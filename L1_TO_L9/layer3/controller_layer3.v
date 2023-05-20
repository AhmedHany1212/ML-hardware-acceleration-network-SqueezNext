module controller_layer3(L,z,BRAM1_addr,BRAM2_addr,weight_addr,clk,rst,z_zero,temp_zero,WE_2);
input wire clk,rst;
output wire [1:0] L;
 wire [4:0] y;
output wire [9:0] BRAM1_addr,BRAM2_addr;
output wire [2:0] weight_addr;
output wire 		z,z_zero,temp_zero;
output wire WE_2;
wire [4:0] row,col;
 wire [4:0] x;
wire L_zero,y_zero,x_zero,temp_count,temp_5;

L_counter_Layer_3  L_counter_layer_3 		(L,L_zero,clk,rst,temp_zero);
z_counter_Layer_3  Z_counter_layer_3 		(z,z_zero,clk,rst,L_zero,temp_zero);
y_counter_Layer_3  y_counter_layer_3 		(y,y_zero,clk,rst,z_zero,temp_count,temp_zero);
x_counter_Layer_3  x_counter_layer_3 		(x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
temp_counter_L3	 temp_counter_L3			(temp_count,temp_zero,clk,rst,x_zero,temp_5);//R_counter R_counter_layer_3		(R,R_zero,clk,rst,L_zero,temp_zero);
BRAM2_out_Layer_3  BRAM2_out 					(BRAM2_addr,clk,rst,L_zero,x,y);
//BRAM2_out(BRAM2_addr,clk,rst,z_zero,x,y);
//assign load=R_zero;
assign weight_addr={z,L};
assign row=x;
assign col=y;
assign BRAM1_addr = {row,col};
assign WE_2=(z==0&&L==3)&&!temp_5;
endmodule
