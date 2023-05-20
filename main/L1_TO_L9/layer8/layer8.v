module layer8(clk,rst,clk_mem,BRAM_L8_in,u_L7,BRAM1_addr_in,BRAM2_addr,temp_zero_final,BRAM1_in,ld_L7,u,load);
input wire clk,rst,clk_mem,ld_L7;
input wire [9:0] BRAM1_addr_in;
wire [9:0] BRAM1_addr,BRAM_skip_addr;
input wire [16*16-1:0] BRAM_L8_in;
input wire [2:0] u_L7;
output wire [16*16-1:0] BRAM1_in;
output wire temp_zero_final;
output wire [9:0] BRAM2_addr;
output wire  load;
output wire [2:0] u;
assign temp_zero_final=temp_zero&&u==4;
parameter N=256;
parameter ADDR_WIDTH=3;
parameter ADDR_WIDTH_15=1; 
parameter ADDR_WIDTH_17=4;
parameter M=16;
parameter addr_width=10;
wire [M*18-1:0]  bias_conv14_1,bias_conv14_2,bias_conv14,bias_conv15,bias_conv16_1,bias_conv16_2,bias_conv16,
                    bias_conv17_1,bias_conv17_2,bias_conv17 ,bias_conv18_1,bias_conv18_2,bias_conv18_3,bias_conv18_4,bias_conv18,bias_out;
 wire  temp_zero_new,padding,temp_zero;
 wire [9:0] BRAM1_addr_L8,SKIP_addr_L8;

 wire [16*16-1:0] BRAM1_DATA_L8;
 wire [2:0]weight_addr_conv14;
 wire 	 weight_addr_conv15;
 wire [2:0]weight_addr_conv16;
 wire [3:0]weight_addr_conv17;
 wire [2:0]weight_addr_conv18;
 wire [N*16-1:0] conv14_out,conv15_out,conv16_out,conv17_out,conv18_out,weight_mux_out;
 wire [M*16-1:0] BRAM1_out,BRAM2_out,BRAM_out_without_padding,BRAM_out_padding,BRAM_SKIP_out;
wire  [1:0] z;
cont_layer8 cont_8(clk,rst,u,z,load,BRAM2_addr,BRAM1_addr,BRAM_skip_addr,weight_addr_conv14,weight_addr_conv15,weight_addr_conv16,weight_addr_conv17,weight_addr_conv18,temp_zero_new,padding,temp_zero);
CONV14 #(N,ADDR_WIDTH)conv_14(weight_addr_conv14,clk,conv14_out);
CONV15 #(N,ADDR_WIDTH_15)conv_15(weight_addr_conv15,clk,conv15_out);
CONV16 #(N,ADDR_WIDTH)conv_16(weight_addr_conv16,clk,conv16_out);
CONV17 #(N,ADDR_WIDTH_17)conv_17(weight_addr_conv17,clk,conv17_out);
CONV18 #(N,ADDR_WIDTH)conv_18(weight_addr_conv18,clk,conv18_out);
mux_weight_5_1_L8 #(N)mux_conv(conv14_out,conv15_out,conv16_out,conv17_out,conv18_out,u,weight_mux_out);

assign BRAM1_addr_L8= (u_L7==5) ? BRAM1_addr_in:BRAM1_addr;
assign SKIP_addr_L8= (u==4) ? 	BRAM_skip_addr:BRAM1_addr_in;
assign BRAM1_DATA_L8= (u_L7==5) ? BRAM_L8_in:BRAM1_in;
MEM_L8_1 #(M)bram1(BRAM1_addr_L8,BRAM1_addr,clk_mem,BRAM1_DATA_L8,(ld_L7&&u_L7==5)||(load&&(u==1||u==3)),BRAM1_out);
MEM_L8_2 #(M)bram_skip(SKIP_addr_L8,clk_mem,BRAM_L8_in,(ld_L7&&u_L7==5),BRAM_SKIP_out);
MEM_L8_2 #(M,addr_width)bram2(BRAM2_addr,clk,BRAM1_in,load&&(u==0||u==2),BRAM2_out);

mux_input_2_1_L8   #(M)mux_BRAM(BRAM_out_without_padding,BRAM1_out,BRAM2_out,u);
mux_padding_2_1_L8   #(M)mux_padding(BRAM_out_padding,padding,BRAM_out_without_padding);

BIAS_layer8_conv14_1 #(M)conv14_1(bias_conv14_1);
BIAS_layer8_conv14_2 #(M)conv14_2(bias_conv14_2);
mux_bias_L8 bias_14(bias_conv14_1,bias_conv14_2, z[0],bias_conv14);
BIAS_layer8_conv15 #(M)bias_15(bias_conv15);
BIAS_layer8_conv16_1 #(M)conv16_1(bias_conv16_1);
BIAS_layer8_conv16_2 #(M)conv16_2(bias_conv16_2);
mux_bias_L8 bias_16(bias_conv16_1,bias_conv16_2, z[0],bias_conv16);
BIAS_layer8_conv17_1 #(M)conv17_1(bias_conv17_1);
BIAS_layer8_conv17_2 #(M)conv17_2(bias_conv17_2);
mux_bias_L8 bias_17(bias_conv17_2,bias_conv17_1, z[0],bias_conv17);
BIAS_layer8_conv18_1 #(M)conv18_1(bias_conv18_1);
BIAS_layer8_conv18_2 #(M)conv18_2(bias_conv18_2);
BIAS_layer8_conv18_3 #(M)conv18_3(bias_conv18_3);
BIAS_layer8_conv18_4 #(M)conv18_4(bias_conv18_4);

mux4_1_L8 bias_18(bias_conv18_3,bias_conv18_4,bias_conv18_1,bias_conv18_2,z,bias_conv18);
mux_bias_5_1_L8  #(M)bais(bias_conv14,bias_conv15,bias_conv16,bias_conv17,bias_conv18,u,bias_out);

M_A_T16x16_L8#(M)adder_tree(BRAM_out_padding,clk,rst,weight_mux_out,bias_out,load||temp_zero_new,BRAM1_in,BRAM_SKIP_out,u);


endmodule

