module cont_layer7(clk,rst,u,BRAM2_addr,BRAM1_addr1,BRAM1_addr2,load,weight_addr_conv8,
						weight_addr_conv9,weight_addr_conv10,weight_addr_conv11,weight_addr_conv12,
						weight_addr_conv13,padding,temp_zero_new,z,u_Reg1,u_Reg5,u_Reg3,temp_zero,BRAM_TRANS_addr,BRAM_skip_addr);
						
input wire clk,rst;
output wire [9:0] BRAM2_addr,BRAM1_addr1,BRAM1_addr2,BRAM_TRANS_addr,BRAM_skip_addr;
output wire  load,padding,temp_zero_new,temp_zero;
output wire [2:0] u,u_Reg1,u_Reg5,u_Reg3;
output wire [2:0] weight_addr_conv8;
output wire [1:0] weight_addr_conv9,z;
output wire  weight_addr_conv10;
output wire [2:0] weight_addr_conv11;
output wire [3:0] weight_addr_conv12;
output wire [2:0] weight_addr_conv13;
 wire  [4:0] x,y;
wire [2:0] u_Reg2,u_Reg4;
wire L_zero,k_zero,z_zero,y_zero,x_zero,j_zero,temp_counter,temp_6,L,u_1_2;
wire [4:0] x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5;
wire [1:0] k_Reg,j_Reg,k,j;
 //wire [2:0] R;

L_count_L7 L_count_layer7(L_zero,L,clk,rst,temp_zero);
k_count_L7 K_count_layer7(k,k_zero,u,clk,rst,temp_zero);
J_count_L7 J_count_layer7(u,L_zero,clk,rst,j,j_zero,temp_zero);
Z_count_L7 Z_count_layer7(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero,u_1_2);
y_count_L7 y_count_layer7(u,z_zero,L_zero,clk,y,y_zero,rst,temp_counter,temp_zero);
x_count_L7 x_count_layer7(x,x_zero,u,y_zero,clk,rst,temp_counter,temp_zero);
temp_count_L7 temp_count(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
u_count_L7 u_count_layer7(clk,u,rst,temp_zero,u_1_2);
R_count_L7 R_count_layer7 (u,L_zero,j_zero,k_zero,clk,rst,R_zero);
Reg_xy_1_L7 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_1_L7 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_1_L7 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_1_L7 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_1_L7 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);
Reg_k_L7 Reg_k(k_Reg,clk,rst,k);
Reg_j_L7 Reg_j(j_Reg,clk,rst,j);
Reg_u_L7 Reg_u1(u_Reg1,clk,rst,u);
Reg_u_L7 Reg_u2(u_Reg2,clk,rst,u_Reg1);
Reg_u_L7 Reg_u3(u_Reg3,clk,rst,u_Reg2);
Reg_u_L7 Reg_u4(u_Reg4,clk,rst,u_Reg3);
Reg_u_L7 Reg_u5(u_Reg5,clk,rst,u_Reg4);

BRAM1_addr_L7 BRAM1_addr(BRAM1_addr1,BRAM1_addr2,L_zero,x_Reg5,y_Reg5,x,y,u,k,z);
BRAM2_address_L7 BRAM2_address(BRAM2_addr,x_Reg5,y_Reg5,x,y,z,u,L,j);
BRAM_SKIP_address_L7 BRAM_SKIP_address_L7(z,u,x_Reg4,y_Reg4,BRAM2_addr,BRAM_skip_addr);

assign BRAM_TRANS_addr= (L) ? {x,y+5'b10000} : {x,y};
assign load=R_zero;
assign weight_addr_conv8={z,L};
assign weight_addr_conv9={z[0],L};
assign weight_addr_conv10=L;
assign weight_addr_conv11={z[0],k};
assign weight_addr_conv12={z[0],j,L};
assign weight_addr_conv13={z,L};
assign padding =((u==4&&((x_Reg1+j_Reg==0)||(x_Reg1+j_Reg==16)))||(u==3&&((y_Reg1+k_Reg==0)||(y_Reg1+k_Reg==16))))||(temp_6);
endmodule


