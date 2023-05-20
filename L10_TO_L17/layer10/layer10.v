
module layer10(clk,clk_mem,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr,u,load,TRANS_ADDR1,TRANS_ADDR2,READ_TRANS,
weight_addr_conv25,weight_addr_conv26,weight_addr_conv27,weight_addr_conv28,weight_addr_conv29,
					temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,BRAM2_out,
					BRAM_L10_in,BRAM1_addr_in_L9_1,BRAM1_addr_in_L9_2,BRAM1_addr_in_L9,u_L9,Ld_L9);

//adder tree param
parameter N_weight_out=256;
parameter N_BRAM1=8; //=N_BRAM2
parameter N_adder_tree=16;

//convolution parameters

parameter conv25_addr_WIDTH=5;
parameter conv26_addr_WIDTH=3;
parameter conv27_addr_WIDTH=5;
parameter conv28_addr_WIDTH=6;
parameter conv29_addr_WIDTH=5;

// i/o ports 
input wire [16*16-1:0]BRAM_L10_in;
input wire [9:0]BRAM1_addr_in_L9,BRAM1_addr_in_L9_1,BRAM1_addr_in_L9_2;
input wire [2:0] u_L9; 
input wire Ld_L9;
input   clk,rst,clk_mem;
input wire [2:0] z;//
input wire [2:0] u;//
input READ_TRANS;
//Bram addresses
output wire  [N_adder_tree*16-1:0] BRAM2_out;
input wire [9:0]BRAM2_addr1,BRAM2_addr2,BRAM1_addr,BRAM_skip_addr1,BRAM_skip_addr2,TRANS_ADDR1,TRANS_ADDR2;
input wire [conv25_addr_WIDTH-1:0] weight_addr_conv25;
input wire [conv26_addr_WIDTH-1:0] weight_addr_conv26;
input wire [conv27_addr_WIDTH-1:0] weight_addr_conv27;
input wire [conv28_addr_WIDTH-1:0] weight_addr_conv28;
input wire [conv29_addr_WIDTH-1:0] weight_addr_conv29;
input wire  load,temp_zero_new,padding;

//convolutions data and variables
wire [N_weight_out*16-1:0] weight_out,weight_out_conv25,weight_out_conv26,weight_out_conv27;
wire [N_weight_out*16-1:0] weight_out_conv28,weight_out_conv29;

wire [N_adder_tree*18-1:0]   bias;

//BRAM1 output/input ports
wire  [N_BRAM1*16-1:0] BRAM1_out1,BRAM1_out2,BRAM_input1,BRAM_input2,BRAM1_DATA_L10_1,BRAM1_DATA_L10_2;
wire  [N_adder_tree*16-1:0] BRAM1_out,BRAM1_DATA_L10;
//BRAM2 output/input ports
wire  [N_BRAM1*16-1:0] BRAM2_out1,BRAM2_out2,BRAM_skip_out1,BRAM_skip_out2;
wire  [N_adder_tree*16-1:0] BRAM_SKIP_out;
//and other signals
wire  [N_adder_tree*16-1:0] filter_output;
wire  [N_adder_tree*16-1:0] BRAM_after_padding,selected_input_bram;
//memory flags
wire  mem1_load,mem2_load;
wire [9:0]BRAM2_addr1_layer,BRAM2_addr2_layer,BRAM1_addr_L10,SKIP_addr_L10_1,SKIP_addr_L10_2;

//assign BRAM1_out={BRAM1_out2,BRAM1_out1};
assign BRAM2_out={BRAM2_out2,BRAM2_out1};
assign BRAM_SKIP_out ={BRAM_skip_out2,BRAM_skip_out1};
assign BRAM_input1=filter_output[127:0];
assign BRAM_input2=filter_output[255:128];

//memory load signals 
assign mem1_load=load&&(u==1||u==3);
assign mem2_load=load&&(u==2||u==0||u==4);


//controller

// cont_layer9     cont_layer9(BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,clk,rst,u,load,weight_addr_conv19,weight_addr_conv20,weight_addr_conv21,weight_addr_conv22,weight_addr_conv23,weight_addr_conv24,temp_zero_new,padding);
//convolution memory -->fetch conv_weigths
CONV25 conv25 (weight_out_conv25,weight_addr_conv25,clk);
CONV26 conv26 (weight_out_conv26,weight_addr_conv26,clk);
CONV27 conv27 (weight_out_conv27,weight_addr_conv27,clk);
CONV28 conv28 (weight_out_conv28,weight_addr_conv28,clk);
CONV29 conv29 (weight_out_conv29,weight_addr_conv29,clk);
//selection by "u" from 6 convolutions 
//module mux_weight_6_1  #(par (weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13,u,weight_out);

mux_weight_6_1_L10_L16   mux_weight_6_1(weight_out_conv25,weight_out_conv26,weight_out_conv27,weight_out_conv28,weight_out_conv29,u,weight_out);
assign BRAM1_addr_L10= (u_L9==5) ? BRAM1_addr_in_L9:BRAM1_addr;

assign BRAM1_DATA_L10= (u_L9==5) ? BRAM_L10_in:filter_output;

assign BRAM1_DATA_L10_1= BRAM1_DATA_L10[127:0];
assign BRAM1_DATA_L10_2= BRAM1_DATA_L10[255:128];

assign SKIP_addr_L10_1= (u==4) ? 	BRAM_skip_addr1:BRAM1_addr_in_L9_1;
assign SKIP_addr_L10_2= (u==4) ? 	BRAM_skip_addr2:BRAM1_addr_in_L9_2;

//which memory to read from (as input to the layer)   sel="u" 
mux_input_2_1_L10_L16 mux_input_2_1 (selected_input_bram,BRAM1_out,BRAM2_out,u);

//memory1
//BRAM_layer10  memory1 (BRAM1_out1,BRAM1_out2,BRAM_input1,BRAM_input2,BRAM1_addr1,BRAM1_addr2,mem1_load,clk_mem); //8brams
BRAM_L9_1  memory1(BRAM1_addr_L10,BRAM1_addr,clk_mem,BRAM1_DATA_L10,(Ld_L9&&u_L9==5)||mem1_load,BRAM1_out);
BRAM_layer11  memory_skip (BRAM_skip_out1,BRAM_skip_out2,BRAM1_DATA_L10_1,BRAM1_DATA_L10_2,SKIP_addr_L10_1,SKIP_addr_L10_2,(Ld_L9&&u_L9==5),clk_mem); //8brams
//BRAM_layer10  memory_skip (BRAM_skip_out1,BRAM_skip_out2,BRAM_input1,BRAM_input2,BRAM_skip_addr1,BRAM_skip_addr2,1'b0,clk_mem); //8brams
//padding 
mux_padding_2_1_L10_L16  mux_padding_2_1(BRAM_after_padding,padding,selected_input_bram);///

//BIAS_layer7 BIAS_layer7 (.q(bias));
BIAS_layer10 #(N_adder_tree) BIAS_layer10 (bias,z,u);
//16*16 filter
M_A_T16x16_L10_L16  M_A_T16x16 (BRAM_after_padding,clk,rst,weight_out,bias,load||temp_zero_new,filter_output,BRAM_SKIP_out,u);//
//skip_connection memory

//memory2
BRAM_layer11  memory2 (BRAM2_out1,BRAM2_out2,BRAM_input1,BRAM_input2,BRAM2_addr1_layer,BRAM2_addr2_layer,mem2_load,clk_mem); //8brams

assign BRAM2_addr1_layer= (READ_TRANS) ? TRANS_ADDR1 : BRAM2_addr1;
assign BRAM2_addr2_layer= (READ_TRANS) ? TRANS_ADDR2 : BRAM2_addr2; 

endmodule
