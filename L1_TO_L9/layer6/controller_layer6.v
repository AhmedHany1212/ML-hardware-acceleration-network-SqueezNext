module controller_layer6(z,L,BRAM1_addr,address_act,BRAM_SKIP_addr,weight_addr,clk,rst,temp_zero_new,temp_5,temp_zero);
input wire clk,rst;
output wire temp_zero_new,temp_5,temp_zero;
output wire [1:0] L;
wire [4:0] x,y;
output wire [9:0] BRAM1_addr,BRAM_SKIP_addr;
output reg [9:0] address_act;
output wire [4:0] weight_addr;
output wire [2:0] z;
wire [4:0] row,col;
wire [9:0] BRAM2_addr;
wire L_zero,y_zero,x_zero,temp_count;
wire 		z_zero;
wire [4:0] x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5;

L_counter_Layer_6  L_counter_layer_6 		(L,L_zero,clk,rst,temp_zero);
z_counter_Layer_6  Z_counter_layer_6 		(z,z_zero,clk,rst,L_zero,temp_zero);
y_counter_Layer_6  y_counter_layer_6 		(y,y_zero,clk,rst,z_zero,temp_count,temp_zero);
x_counter_Layer_6  x_counter_layer_6 		(x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
temp_counter_Layer_6  temp_counter          (temp_count,temp_zero,clk,rst,x_zero,temp_zero_new,temp_5);
//R_counter R_counter_layer_6		(R,R_zero,clk,rst,L_zero,temp_zero);
BRAM2_out_Layer_6  BRAM2_out 					(BRAM2_addr,clk,rst,L_zero,x,y);
Reg_xy_1_L2 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L2 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L2 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L2 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L2 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);

 always @(*)
  begin
   case (z)
    1:  address_act = BRAM2_addr;
	 2:  address_act = BRAM2_addr;
	 3:  address_act = BRAM2_addr;
	 4:  address_act = BRAM2_addr;
	 5:  address_act = BRAM2_addr + 5'b10000;
	 6:  address_act = BRAM2_addr + 5'b10000;
	 7:  address_act = BRAM2_addr + 5'b10000;
	 0:  address_act = BRAM2_addr + 5'b10000;
   endcase
  end
//BRAM2_out(BRAM2_addr,clk,rst,z_zero,x,y);
//assign load=R_zero;
assign BRAM_SKIP_addr= ((z==5)||(z==6)||(z==7)||(z==0)) ? {x_Reg5>>1,(y_Reg5>>1)+5'b10000} : {x_Reg5>>1,(y_Reg5>>1)} ;
//assign BRAM_skip_addr1_L2 	= y[0]||x_Reg5[0] ? {x_Reg5>>1,(y_Reg5>>1)+5'b10000} : {x_Reg5>>1,y_Reg5>>1} ;

assign weight_addr={z,L};
assign row=x;
assign col=y;
assign BRAM1_addr = {row,col};
endmodule
