module layer_2(clk,rst,BRAM2_in,temp_zero,BRAM1_addr_L2,L,out_layer,load_L2,z,BRAM2_addr_L2,BRAM_skip_addr1_L2,x_first_bit,y_first_bit,temp_zero_new,WE_SKIP);

parameter M=16;
parameter M2=64;
parameter N=128;
parameter ADDR_WIDTH_conv2=4;
parameter ADDR_WIDTH_conv3=3;
parameter addr_width=10;

input clk,rst;
input [M2*16-1:0] BRAM2_in;
output wire temp_zero,temp_zero_new;
output wire [9:0] BRAM1_addr_L2,BRAM2_addr_L2,BRAM_skip_addr1_L2;
output [2:0] L;
output load_L2,z,WE_SKIP;
output x_first_bit,y_first_bit;
output  [M*16-1:0]       out_layer;
wire [3:0] weight_addr_conv2;
wire [2:0] weight_addr_conv3;
wire [2:0] L_reg;
wire padding_L2,u,u_Reg;
//wire [M2*16-1:0] out_Bram;
wire [18*16-1:0]  bais_out;

wire [8*16-1:0]  data_in_AT,BRAM_out_without_padding;
wire [N*16-1:0]  out_conv2,out_conv3,out_mux;
wire [8*16-1:0]  out_layer1,out_layer2;
//assign out_layer1=out_layer[127:0];
//assign out_layer2=out_layer[255:128];
assign WE_SKIP=load_L2&&(y_first_bit||(z&&u))&&!x_first_bit;

controller_L2 controller_layer_2(clk,rst,BRAM1_addr_L2,BRAM2_addr_L2,weight_addr_conv2,weight_addr_conv3,padding_L2,load_L2,u,z,L,temp_zero_new,temp_zero,BRAM_skip_addr1_L2,x_first_bit,y_first_bit);
//BRAM_layer2 #(M2)Bram(BRAM1_addr_L2,clk,rst,BRAM2_in);
Reg_AT_L_L2 	R_L_L2(.D(L),.clk(clk),.rst(rst),.Q(L_reg));
mux8_1_L2 #(8)mux_bram(BRAM2_in[127:0],BRAM2_in[255:128],BRAM2_in[383:256],BRAM2_in[511:384],BRAM2_in[639:512],BRAM2_in[767:640],BRAM2_in[895:768],BRAM2_in[1023:896],L_reg,BRAM_out_without_padding);
MUX_padding_2X1  MUX_padding_2X1 (data_in_AT,padding_L2,BRAM_out_without_padding);
Reg_AT_u_L2 	R_u_L2(.D(u),.clk(clk),.rst(rst),.Q(u_Reg));
CONV2 #(N,ADDR_WIDTH_conv2)conv2(weight_addr_conv2,clk,out_conv2);
CONV3 #(N,ADDR_WIDTH_conv3)conv3(weight_addr_conv3,clk,out_conv3);
mux2_1_L2 mux_wieght_L2(out_conv2,out_conv3,!u_Reg,out_mux);
M_A_T8x16_L2#(M)adder_tree(data_in_AT,clk,rst,out_mux,bais_out,load_L2||temp_zero_new,out_layer);
BIAS_L2 #(3*M)bais(bais_out,z,u);

//MEM_SKIPL2  MEM_L2skip_2 (BRAM_skip_out1,BRAM_skip_out2,out_layer1,out_layer2,BRAM_skip_addr1_L2,BRAM_skip_addr2_L2,load_L2&&(y_first_bit||(z&&u))&&!x_first_bit,clk); //8brams
//meml2_2 #(M,addr_width) meml2_2(.addr(BRAM2_addr_L2),.clk(clk),.in_filter(out_layer),.wr(load_L2&&!u_Reg&&z),.out_filter(BRAM2_out_L2));

endmodule