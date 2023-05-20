module cont_layer9(BRAM2_addr1,BRAM2_addr2,BRAM1_addr,clk,rst,u,u_Reg1,u_Reg5,u_Reg3,load,weight_addr_conv19,
weight_addr_conv20,weight_addr_conv21,weight_addr_conv22,
weight_addr_conv23,weight_addr_conv24,temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,temp_zero,BRAM2_address_out,L);

input wire clk,rst;
output wire  load,temp_zero_new,padding,temp_zero;
output wire [1:0] L;
output wire [4:0]weight_addr_conv19;
output wire [3:0]weight_addr_conv20;
output wire [2:0]weight_addr_conv21;
output wire [4:0]weight_addr_conv22;
output wire [5:0]weight_addr_conv23;
output wire [4:0]weight_addr_conv24;
output wire [9:0]BRAM2_addr1,BRAM2_addr2,BRAM1_addr,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_address_out; 
output wire [2:0] u,u_Reg1,u_Reg5,u_Reg3;
output wire  [2:0] z;
wire L_zero,k_zero,z_zero,y_zero,x_zero,j_zero,temp_counter,temp_6,u_1_2;
wire [3:0] x,y,x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5; ////$
wire [2:0] u_Reg2,u_Reg4;
wire [1:0] k,j,k_Reg,j_Reg;

L_count_L9 L_count_layer9(L_zero,L,clk,rst,temp_zero,u);
k_count_L9 K_count_layer9(k,k_zero,u,clk,rst,temp_zero,L_zero);
J_count_L9 J_count_layer9(u,L_zero,clk,rst,j,j_zero,temp_zero);
Z_count_L9 Z_count_layer9(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero,u_1_2);
y_count_L9 y_count_layer9(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero,u);
x_count_L9 x_count_layer9(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero,u);
temp_count_L9 temp_count_layer9(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
u_count_L9 u_count_layer9(clk,u,rst,temp_zero,u_1_2);
R_count_L9 R_count_layer9 (u,L_zero,j_zero,k_zero,clk,rst,R_zero);

Reg_xy_1_L9 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L9 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L9 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L9 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L9 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);


BRAM1_addr_L9    BRAM1_address(BRAM1_addr,L,x_Reg5,y_Reg5,x,y,u,k,z);
BRAM2_addr_L9   BRAM2_addr(BRAM2_addr1,BRAM2_addr2,L,x_Reg5,y_Reg5,x,y,u,j,z);
BRAM_SKIP_address_L9 BRAM_SKIP_address_L9(z,u,x_Reg4,y_Reg4,BRAM2_addr1,BRAM2_addr2,BRAM_skip_addr1,BRAM_skip_addr2);
BRAM2_asddress_L9 BRAM2_asddress_L9(BRAM2_address_out,L,x_Reg5,y_Reg5,x,y,u,j,z );


Reg_k_L9 Reg_k(k_Reg,clk,rst,k);
Reg_j_L9 Reg_j(j_Reg,clk,rst,j);

Reg_u_L9 Reg_u1(u_Reg1,clk,rst,u);
Reg_u_L9 Reg_u2(u_Reg2,clk,rst,u_Reg1);
Reg_u_L9 Reg_u3(u_Reg3,clk,rst,u_Reg2);
Reg_u_L9 Reg_u4(u_Reg4,clk,rst,u_Reg3);
Reg_u_L9 Reg_u5(u_Reg5,clk,rst,u_Reg4);

assign load=R_zero;
assign weight_addr_conv19={z,L};//5
assign weight_addr_conv20={z[1],z[0],L};//4
assign weight_addr_conv21={z[0],L};//3
assign weight_addr_conv22={z[1],z[0],k,L[0]};//5
assign weight_addr_conv23={z[1],z[0],j,L};//6
assign weight_addr_conv24={z,L};//5
assign padding =((u==4&&((x_Reg1+j_Reg==0)||(x_Reg1+j_Reg==9)))||(u==3&&((y_Reg1+k_Reg==0)||(y_Reg1+k_Reg==9))))||(temp_6);




endmodule


