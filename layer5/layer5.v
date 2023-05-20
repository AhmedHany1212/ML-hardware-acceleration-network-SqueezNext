
module layer5 (clk,rst,BRAM_out1,BRAM_out2,BRAM1_addr,BRAM2_addr,out_adder,temp_zero,WE_1,WE_2);

input clk,rst;
input wire  [N_BRAM1*16-1:0]  BRAM_out1,BRAM_out2;
output wire [M*16-1:0] out_adder;
output wire [9:0] BRAM1_addr,BRAM2_addr;
output wire temp_zero;
output wire WE_1,WE_2;
wire load;
parameter N=64;
parameter ADDR_WIDTH=4;
parameter N_BRAM1=8;
parameter M=8;
parameter addr_width=10;
//output wire [M*16-1:0] out_filter1,out_filter2;

wire  L;
wire [1:0] j_Reg;
wire [4:0] x_Reg;
wire  z,temp_zero_new;
wire  [N_BRAM1*16-1:0] out_mux,out_mux_padding;
wire [ADDR_WIDTH-1:0] addr_conv;
wire [N*16-1:0] conv_out ;
wire [M*18-1:0] out_bias1,out_bias2,out_bias;
//wire [M*16-1:0] out_adder;

controller_layer5 controller_layer5(L,z,j_Reg,x_Reg,BRAM1_addr,BRAM2_addr,addr_conv,load,clk,rst,temp_zero_new,temp_zero);
CONV6 #(N,ADDR_WIDTH) conv6(addr_conv,clk,conv_out);
//BRAM_5_1 #(N_BRAM1)BRAM_5_1(BRAM_out1,BRAM1_addr,clk,rst);
//BRAM_5_2 #(N_BRAM1)BRAM_5_2(BRAM_out2,BRAM1_addr,clk,rst);
mux2_1_L5 M1(BRAM_out1,BRAM_out2,!L,out_mux);
or(Y_or, x_Reg+j_Reg==0, x_Reg+j_Reg==31);
mux2_1_L5 padding(out_mux,128'b0, Y_or,out_mux_padding);
BIAS_layer5 #(M)BIAS_5_1(out_bias1);
BIAS_layer5_2 #(M)BIAS_5_2(out_bias2);
mux_bias mux_bias(out_bias1,out_bias2, z,out_bias);
M_A_T8x8 #(M)M_A_T8x8(out_mux_padding,clk,rst,conv_out,out_bias,load||temp_zero_new,out_adder);
//Demux1_2 demux1(out1_demux,out2_demux,out_adder,!z);
//mem5_6_1 #(M)MEM5_6_1(BRAM2_addr,clk,out1_demux,load&&z,out_filter1);
//mem5_6_2 #(M)MEM5_6_2(BRAM2_addr,clk,out2_demux,load&&!z&&!temp_zero_new,out_filter2);
assign WE_1=load&&z;
assign WE_2=load&&!z&&!temp_zero_new;
endmodule