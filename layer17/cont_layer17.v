module cont_layer17(clk,rst,u,load,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,weight_addr_conv60_65,weight_addr_conv61,weight_addr_conv62,weight_addr_conv63,weight_addr_conv64,temp_zero_new,padding,z,u_Reg1,u_Reg5,u_Reg3,temp_zero);
input wire clk,rst;
output wire  load,temp_zero_new,padding,temp_zero;
output wire [2:0] u,u_Reg1,u_Reg5,u_Reg3;
output wire  [3:0] z;
output wire [6:0]weight_addr_conv60_65;
output wire [5:0]weight_addr_conv61;
output wire [4:0]weight_addr_conv62;
output wire [6:0]weight_addr_conv63;
output wire [7:0]weight_addr_conv64;
//output wire [6:0]weight_addr_conv65;
output wire [9:0] BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2;
wire L_zero,k_zero,z_zero,y_zero,x_zero,j_zero,temp_counter,temp_6,u_1_2;
wire [2:0] x,y;
wire [2:0] L;
wire [1:0] k,j,k_Reg,j_Reg;
wire [2:0] x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5; 
wire [2:0] u_Reg2,u_Reg4;

L_count_L17 L_count_layer17(L_zero,L,clk,rst,temp_zero,u);
k_count_L17 K_count_layer17(k,k_zero,u,clk,rst,temp_zero,L_zero);
J_count_L17 J_count_layer17(u,L_zero,clk,rst,j,j_zero,temp_zero);
Z_count_L17 Z_count_layer17(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero,u_1_2);
y_count_L17 y_count_layer17(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero,u);
x_count_L17 x_count_layer17(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero,u);
temp_count_L17 temp_count_layer17(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
u_count_L17 u_count_layer17(clk,u,rst,temp_zero,u_1_2);
R_count_L17 R_count_layer17 (u,L_zero,j_zero,k_zero,clk,rst,R_zero);

Reg_k_L17 Reg_k(k_Reg,clk,rst,k);
Reg_j_L17 Reg_j(j_Reg,clk,rst,j);

Reg_xy_1_L17 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L17 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L17 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L17 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L17 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);
Reg_u_L17 Reg_u1(u_Reg1,clk,rst,u);
Reg_u_L17 Reg_u2(u_Reg2,clk,rst,u_Reg1);
Reg_u_L17 Reg_u3(u_Reg3,clk,rst,u_Reg2);
Reg_u_L17 Reg_u4(u_Reg4,clk,rst,u_Reg3);
Reg_u_L17 Reg_u5(u_Reg5,clk,rst,u_Reg4);

BRAM1_addr_L17 BRAM1_addr(BRAM1_addr1,BRAM1_addr2,L,x_Reg5,y_Reg5,x,y,u,k,z);
BRAM2_address_L17 BRAM2_address(BRAM2_addr1,BRAM2_addr2,x_Reg5,y_Reg5,x,y,z,u,L,j);
//BRAM_SKIP_address BRAM_SKIP_address(x_Reg4,y_Reg4,z,u,L,BRAM_skip_addr1,BRAM_skip_addr2);

assign load=R_zero;
assign weight_addr_conv60_65={z,L};//7
assign weight_addr_conv61={z[2],z[1],z[0],L};//6
assign weight_addr_conv62={z[1],z[0],L};//5
assign weight_addr_conv63={z[2],z[1],z[0],k,L[1],L[0]};//7
assign weight_addr_conv64={z[2],z[1],z[0],j,L};//8
//assign weight_addr_conv65={z,L};//7
assign padding =((u==4&&((x_Reg1+j_Reg==0)||(x_Reg1+j_Reg==5)))||(u==3&&((y_Reg1+k_Reg==0)||(y_Reg1+k_Reg==5))))||(temp_6);

endmodule


