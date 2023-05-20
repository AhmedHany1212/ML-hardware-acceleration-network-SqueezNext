module layer7(clk,rst,BRAM_out_TRANS,BRAM_TRANS_addr,BRAM2_in,u,BRAM2_addr,temp_zero_final,load);
parameter N_weight_out=256;
parameter N_BRAM1=8;
parameter N_adder_tree=16;
parameter conv8_addr_WIDTH=3;
parameter conv9_addr_WIDTH=2;
parameter conv10_addr_WIDTH=1;
parameter conv11_addr_WIDTH=3;
parameter conv12_addr_WIDTH=4;
parameter conv13_addr_WIDTH=3;
input clk,rst;
output wire [9:0] BRAM2_addr;
output wire [2:0] u;
output temp_zero_final,load; 
output wire  [N_adder_tree*16-1:0] BRAM2_in;
assign temp_zero_final=temp_zero&&u==5;
output [9:0] BRAM_TRANS_addr;
input [N_adder_tree*16-1:0] BRAM_out_TRANS; ////////////////////////////
wire [9:0] BRAM1_addr1,BRAM1_addr2,BRAM_skip_addr;
wire  padding,temp_zero_new,temp_zero;
wire [2:0] u_Reg1,u_Reg5,u_Reg3;
wire [1:0] z;
wire [N_weight_out*16-1:0] weight_out,weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13 ;
wire [conv8_addr_WIDTH-1:0] weight_addr_conv8;
wire [conv9_addr_WIDTH-1:0] weight_addr_conv9;
wire [conv10_addr_WIDTH-1:0] weight_addr_conv10;
wire [conv11_addr_WIDTH-1:0] weight_addr_conv11;
wire [conv12_addr_WIDTH-1:0] weight_addr_conv12;
wire [conv13_addr_WIDTH-1:0] weight_addr_conv13;
wire [N_adder_tree*18-1:0]   bias;
wire  [N_BRAM1*16-1:0] BRAM1_out1,BRAM1_out2;
wire  [N_adder_tree*16-1:0] BRAM1_out,BRAM2_out,BRAM_skip_out,BRAM_out,BRAM_out_without_padding;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv8_1,BIAS_L7_conv8_2,BIAS_L7_conv8_3,BIAS_L7_conv8_4,BIAS_L7_conv8;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv9_1,BIAS_L7_conv9_2,BIAS_L7_conv9;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv10;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv11_1,BIAS_L7_conv11_2,BIAS_L7_conv11;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv12_1,BIAS_L7_conv12_2,BIAS_L7_conv12;
wire  [N_adder_tree*18-1:0] BIAS_L7_conv13_1,BIAS_L7_conv13_2,BIAS_L7_conv13_3,BIAS_L7_conv13_4,BIAS_L7_conv13;
wire  [(N_adder_tree/2)*16-1:0] BRAM1_in1,BRAM1_in2;



assign BRAM1_out={BRAM1_out2,BRAM1_out1};
assign BRAM1_in1=BRAM2_in[127:0];
assign BRAM1_in2=BRAM2_in[255:128];


cont_layer7 cont_layer7(clk,rst,u,BRAM2_addr,BRAM1_addr1,BRAM1_addr2,load,weight_addr_conv8,
								weight_addr_conv9,weight_addr_conv10,weight_addr_conv11,weight_addr_conv12,
								weight_addr_conv13,padding,temp_zero_new,z,u_Reg1,u_Reg5,u_Reg3,temp_zero,BRAM_TRANS_addr,BRAM_skip_addr);
								
conv8  conv8 (weight_out_conv8,weight_addr_conv8,clk);
conv9 conv9 (weight_out_conv9,weight_addr_conv9,clk);
conv10 conv10 (weight_out_conv10,weight_addr_conv10,clk);
conv11 conv11 (weight_out_conv11,weight_addr_conv11,clk);
conv12 conv12 (weight_out_conv12,weight_addr_conv12,clk);
conv13 conv13 (weight_out_conv13,weight_addr_conv13,clk);
mux_weight_6_1_L7   mux_weight_6_1(weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13,u_Reg1,weight_out);
//mux_input_2_1 mux_input_2_1 (BRAM_out_without_padding,BRAM1_out,BRAM2_out,u_Reg1);
mux_input_3_1_L7  mux_input_3_1(BRAM_out_without_padding,BRAM1_out,BRAM2_out,BRAM_out_TRANS,u);

BRAM_layer7  BRAM_layer7 (BRAM1_out1,BRAM1_out2,BRAM1_in1,BRAM1_in2,BRAM1_addr1,BRAM1_addr2,load&&(u==2||u==4),clk);
//MEM_L7_skip  BRAM_layer7 (BRAM1_addr,clk,BRAM2_in,load&&u_Reg5==0,BRAM1_out);

mux_padding_2_1_L7  mux_padding_2_1(BRAM_out,padding,BRAM_out_without_padding);

BIAS_layer7_conv8_1 #(N_adder_tree)conv8_1(BIAS_L7_conv8_1);
BIAS_layer7_conv8_2 #(N_adder_tree)conv8_2(BIAS_L7_conv8_2);
BIAS_layer7_conv8_3 #(N_adder_tree)conv8_3(BIAS_L7_conv8_3);
BIAS_layer7_conv8_4 #(N_adder_tree)conv8_4(BIAS_L7_conv8_4);
mux4_1_bias_L7 bias_8(BIAS_L7_conv8_3,BIAS_L7_conv8_4,BIAS_L7_conv8_1,BIAS_L7_conv8_2,z,BIAS_L7_conv8);

BIAS_layer7_conv9_1 #(N_adder_tree)conv9_1(BIAS_L7_conv9_1);
BIAS_layer7_conv9_2 #(N_adder_tree)conv9_2(BIAS_L7_conv9_2);
mux_bias_L7 bias_9(BIAS_L7_conv9_2,BIAS_L7_conv9_1, z[0],BIAS_L7_conv9);

BIAS_layer7_conv10 #(N_adder_tree)bias_10(BIAS_L7_conv10);

BIAS_layer7_conv11_1 #(N_adder_tree)conv11_1(BIAS_L7_conv11_1);
BIAS_layer7_conv11_2 #(N_adder_tree)conv11_2(BIAS_L7_conv11_2);
mux_bias_L7 bias_11(BIAS_L7_conv11_1,BIAS_L7_conv11_2, z[0],BIAS_L7_conv11);

BIAS_layer7_conv12_1 #(N_adder_tree)conv12_1(BIAS_L7_conv12_1);
BIAS_layer7_conv12_2 #(N_adder_tree)conv12_2(BIAS_L7_conv12_2);
mux_bias_L7 bias_12(BIAS_L7_conv12_2,BIAS_L7_conv12_1, z[0],BIAS_L7_conv12);


BIAS_layer7_conv13_1 #(N_adder_tree)conv13_1(BIAS_L7_conv13_1);
BIAS_layer7_conv13_2 #(N_adder_tree)conv13_2(BIAS_L7_conv13_2);
BIAS_layer7_conv13_3 #(N_adder_tree)conv13_3(BIAS_L7_conv13_3);
BIAS_layer7_conv13_4 #(N_adder_tree)conv13_4(BIAS_L7_conv13_4);
mux4_1_bias_L7 bias_13(BIAS_L7_conv13_3,BIAS_L7_conv13_4,BIAS_L7_conv13_1,BIAS_L7_conv13_2,z,BIAS_L7_conv13);


mux_bias_6_1_L7  #(N_adder_tree)mux_bias_6_1(BIAS_L7_conv8,BIAS_L7_conv9,BIAS_L7_conv10,BIAS_L7_conv11,BIAS_L7_conv12,BIAS_L7_conv13,u_Reg3,bias);


M_A_T16x16_L7  M_A_T16x16 (BRAM_out,clk,rst,weight_out,bias,load||temp_zero_new,BRAM2_in,BRAM_skip_out,u);
//BIAS_layer7 BIAS_layer7 (.q(bias));
MEM_L7_skip  MEM_L7_skip (BRAM_skip_addr,clk,BRAM2_in,load&&u_Reg5==0,BRAM_skip_out);

MEM_L7_2  MEM_L7_2 (BRAM2_addr,clk,BRAM2_in,load&&(u_Reg5==1||u==3),BRAM2_out);

endmodule
