module controller_L2	(clk,rst,BRAM1_addr_L2,BRAM2_addr_L2,weight_addr_conv2,weight_addr_conv3,padding_L2,load_L2,u,z,L,temp_zero_new,temp_zero,BRAM_skip_addr1_L2,x_first_bit,y_first_bit);

input wire clk,rst;
output wire [9:0] BRAM1_addr_L2,BRAM2_addr_L2,BRAM_skip_addr1_L2;
output wire [3:0] weight_addr_conv2;
output wire [2:0] weight_addr_conv3;
output wire padding_L2,load_L2,temp_zero,temp_zero_new;
//output wire [2:0] R;
 output wire  [2:0]L;
 output wire  z,x_first_bit,y_first_bit;

wire L_zero,z_zero,y_zero,x_zero,temp_counter,temp_6,R_zero;
wire [4:0] x,y,x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5;

output wire  u;
//wire [2:0] temp;
//L_count L1 (.in_x(u_clk),.in_y(x_clk),.in_Z(y_clk),.u(u),.clk(clk),.rst(rst),.L(L),.out(Z_clk),.temp(temp));
//Z_count Z1 (.temp(temp),.in(Z_clk),.u(u),.clk(clk),.rst(rst),.Z(Z),.out(y_clk));
assign x_first_bit=x[0];
assign y_first_bit=y[0];

L_count_L2 L_count_layer_2(L_zero,L,clk,rst,temp_zero);
Z_count_L2 Z_count_layer_2(z,z_zero,u,L_zero,clk,rst,temp_zero);
u_count_L2 u_count_layer_2(z_zero,clk,rst,u,u_zero,x[0],y[0]);
y_count_L2 y_count_layer_2(u_zero,clk,y,y_zero,rst,temp_counter,temp_zero,L_zero,x[0]);
x_count_L2 x_count_layer_2(x_zero,x,y_zero,clk,rst,temp_counter,temp_zero);
temp_count_L2 temp_count_layer_2(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
Reg_xy_1_L2 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L2 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L2 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L2 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L2 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);

R_count_L2 R_count_layer_2(clk,rst,R_zero,L_zero,temp_zero);

//y_count y1 (.in_x(u_clk),.temp(temp),.clk(clk),.y(y),.out(x_clk),.rst(rst),.in_u(in_u));
//
//x_count x1 (.temp(temp),.u(u),.in_y(x_clk),.in_Z(y_clk),.in_L(Z_clk),.clk(clk),.x(x),.out(u_clk),.rst(rst));
//temp_count t1 (.temp(temp),.U(u),.in_x(u_clk),.in_y(x_clk),.in_Z(y_clk),.in_L(Z_clk),.clk(clk),.out_temp(out_temp),.rst(rst));
//u_count u1 (.in_Z(y_clk),.in_L(Z_clk),.clk(clk),.u(u),.rst(rst),.in_u(in_u));

//R_count R1(.temp(temp),.clk(clk),.rst(rst),.R(R),.L(L),.flag(flag));

assign BRAM1_addr_L2 = {x,y};
assign BRAM2_addr_L2 = {x_Reg5,y_Reg5};

assign BRAM_skip_addr1_L2 	= y[0]||x_Reg5[0] ? {x_Reg5>>1,(y_Reg5>>1)+5'b10000} : {x_Reg5>>1,y_Reg5>>1} ;
//assign BRAM_skip_addr2_L2 = y[0]||x_Reg5[0] ? {(x_Reg5>>1)+5'b10000,(y_Reg5>>1)+5'b10000}: {x_Reg5>>1,(y_Reg5>>1)+5'b10000} ;

assign load_L2=R_zero;
assign weight_addr_conv2={z,L};
assign weight_addr_conv3={L};
assign padding_L2=temp_6;

endmodule
