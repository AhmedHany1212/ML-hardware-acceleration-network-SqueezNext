module cont_layer8(clk,rst,u,z,load,BRAM2_addr,BRAM1_addr,BRAM_skip_addr,weight_addr_conv14,weight_addr_conv15,weight_addr_conv16,weight_addr_conv17,weight_addr_conv18,temp_zero_new,padding,temp_zero);
input wire clk,rst;
output wire  load,temp_zero_new,padding,temp_zero;
output wire [9:0] BRAM2_addr,BRAM1_addr,BRAM_skip_addr;
output wire [2:0] u;
output wire [2:0]weight_addr_conv14;
output wire 	 weight_addr_conv15;
output wire [2:0]weight_addr_conv16;
output wire [3:0]weight_addr_conv17;
output wire [2:0]weight_addr_conv18;

wire L_zero,k_zero,z_zero,y_zero,x_zero,j_zero,temp_counter,temp_6;
wire [4:0] x,y,x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5;
wire  [1:0] L,k,j,k_Reg,j_Reg;
output wire  [1:0] z;


L_count_L8 L_count_layer8(L_zero,L,clk,rst,temp_zero,u);
k_count_L8 K_count_layer8(k,k_zero,u,clk,rst,temp_zero);
J_count_L8 J_count_layer8(u,L_zero,clk,rst,j,j_zero,temp_zero);
Z_count_L8 Z_count_layer8(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero);
y_count_L8 y_count_layer8(u,z_zero,L_zero,clk,y,y_zero,rst,temp_counter,temp_zero);
x_count_L8 x_count_layer8(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero);
temp_count_L8 temp_count_layer8(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
u_count_L8 u_count_layer8(clk,u,rst,temp_zero);
R_count_L8 R_count_layer8 (u,L_zero,j_zero,k_zero,clk,rst,R_zero);
Reg_xy_1_L8 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L8 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L8 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L8 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L8 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);
Reg_k_L8 Reg_k(k_Reg,clk,rst,k);
Reg_j_L8 Reg_j(j_Reg,clk,rst,j);
BRAM1_address_L8 address_1(BRAM1_addr,x_Reg5,y_Reg5,x,y,z,u,L,k);
BRAM2_address_L8 address_2(BRAM2_addr,x_Reg5,y_Reg5,x,y,z,u,L,j);
BRAM_SKIP_address_L8 BRAM_SKIP_address_L8(z,u,x_Reg4,y_Reg4,BRAM1_addr,BRAM_skip_addr);



assign load=R_zero;
assign weight_addr_conv14={z[0],L};//3
assign weight_addr_conv15={L[0]};//1
assign weight_addr_conv16={z[0],k};//3
assign weight_addr_conv17={z[0],j,L[0]};//4
assign weight_addr_conv18={z,L[0]};//3
assign padding =((u==3&&((x_Reg1+j_Reg==0)||(x_Reg1+j_Reg==16)))||(u==2&&((y_Reg1+k_Reg==0)||(y_Reg1+k_Reg==16))))||(temp_6);


endmodule

