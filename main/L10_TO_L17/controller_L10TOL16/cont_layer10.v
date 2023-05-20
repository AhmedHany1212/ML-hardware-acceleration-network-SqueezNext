module CONTROL_L10_TO_L16(BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,clk,rst,u,load,
							weight_addr_conv25,weight_addr_conv26,weight_addr_conv27,weight_addr_conv28,weight_addr_conv29,
							temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,finish_layer,BRAM1_address);

input wire clk,rst;
output wire  load,temp_zero_new,padding;
output wire [2:0] u,z;
output wire [4:0]weight_addr_conv25;
output wire [2:0]weight_addr_conv26;
output wire [4:0]weight_addr_conv27;
output wire [5:0]weight_addr_conv28;
output wire [4:0]weight_addr_conv29;
output wire [9:0]BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,BRAM_skip_addr1,BRAM_skip_addr2,BRAM1_address;
output wire finish_layer;
assign finish_layer=temp_zero&&u==4;
wire L_zero,k_zero,z_zero,y_zero,x_zero,j_zero,temp_counter,temp_6,temp_zero;

wire [2:0] x,y,x_Reg1,y_Reg1,x_Reg2,y_Reg2,x_Reg3,y_Reg3,x_Reg4,y_Reg4,x_Reg5,y_Reg5;
wire [1:0] k,j,k_Reg,j_Reg;
wire  [2:0] L;


L_count_L10 L_count_layer10(L_zero,L,clk,rst,temp_zero,u);
k_count_L10 K_count_layer10(k,k_zero,u,clk,rst,temp_zero,L_zero);
J_count_L10 J_count_layer10(u,L_zero,clk,rst,j,j_zero,temp_zero);
Z_count_L10 Z_count_layer10(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero);
y_count_L10 y_count_layer10(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero);
x_count_L10 x_count_layer10(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero);
temp_count_L10 temp_count_layer10(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
u_count_L10 u_count_layer10(clk,u,rst,temp_zero);
R_count_L10 R_count_layer10 (u,L_zero,j_zero,k_zero,clk,rst,R_zero);

Reg_xy_L10 Reg_xy_1(x_Reg1,y_Reg1,clk,rst,x,y);
Reg_xy_L10 Reg_xy_2(x_Reg2,y_Reg2,clk,rst,x_Reg1,y_Reg1);
Reg_xy_L10 Reg_xy_3(x_Reg3,y_Reg3,clk,rst,x_Reg2,y_Reg2);
Reg_xy_L10 Reg_xy_4(x_Reg4,y_Reg4,clk,rst,x_Reg3,y_Reg3);
Reg_xy_L10 Reg_xy_5(x_Reg5,y_Reg5,clk,rst,x_Reg4,y_Reg4);

BRAM1_address_L10    BRAM1_address_L10(BRAM1_address,L,x_Reg5,y_Reg5,x,y,u,k,z);
BRAM1_addr_L10    BRAM1_addr(BRAM1_addr1,BRAM1_addr2,L,x_Reg5,y_Reg5,x,y,u,k,z);
BRAM2_addr_L10    BRAM2_addr(BRAM2_addr1,BRAM2_addr2,L,x_Reg5,y_Reg5,x,y,u,j,z);
BRAM_SKIP_address_L10 BRAM_SKIP_address_L10(z,u,x_Reg4,y_Reg4,BRAM2_addr1,BRAM2_addr2,BRAM_skip_addr1,BRAM_skip_addr2);



Reg_L10 Reg_k(k_Reg,clk,rst,k);
Reg_L10 Reg_j(j_Reg,clk,rst,j);

assign load=R_zero;
assign weight_addr_conv25={z[1],z[0],L};//5
assign weight_addr_conv26={z[0],L[1],L[0]};//3
assign weight_addr_conv27={z[1],z[0],k,L[0]};//5
assign weight_addr_conv28={z[1],z[0],j,L[1],L[0]};//6
assign weight_addr_conv29={z,L[1],L[0]};//5
assign padding =((u==3&&((x_Reg1+j_Reg==0)||(x_Reg1+j_Reg==9)))||(u==2&&((y_Reg1+k_Reg==0)||(y_Reg1+k_Reg==9))))||(temp_6);

endmodule



