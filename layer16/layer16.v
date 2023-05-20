module layer16(clk,clk_mem,rst,BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,u,load,TRANS_ADDR1,TRANS_ADDR2,REG_TRANS_ADDR1,REG_TRANS_ADDR2,WRITE,REG_WRITE,
			weight_addr_conv55,weight_addr_conv56,weight_addr_conv57,weight_addr_conv58,weight_addr_conv59,
			temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,INPUT_LAYER,BRAM2_out);

//adder tree param
parameter N_weight_out=256;
parameter N_BRAM1=8; //=N_BRAM2
parameter N_adder_tree=16;

//convolution parameters

parameter conv55_addr_WIDTH=5;
parameter conv56_addr_WIDTH=3;
parameter conv57_addr_WIDTH=5;
parameter conv58_addr_WIDTH=6;
parameter conv59_addr_WIDTH=5;

// i/o ports 
input                   clk,rst,clk_mem;
input 						WRITE,REG_WRITE;
input [N_adder_tree*16-1:0] INPUT_LAYER;
//Bram addresses
input wire [9:0]BRAM2_addr1,BRAM2_addr2,BRAM1_addr1,BRAM1_addr2,BRAM_skip_addr1,BRAM_skip_addr2;
input wire [9:0]REG_TRANS_ADDR1,REG_TRANS_ADDR2,TRANS_ADDR1,TRANS_ADDR2;
output wire  [N_adder_tree*16-1:0] BRAM2_out; 
//conntroller counters and parameters 

input wire [2:0] z;//
input wire [2:0] u;//
input wire  load,temp_zero_new,padding;
//convolutions data and variables
wire [N_weight_out*16-1:0] weight_out,weight_out_conv55,weight_out_conv56;
wire [N_weight_out*16-1:0] weight_out_conv58,weight_out_conv59,weight_out_conv57;
input wire [conv55_addr_WIDTH-1:0] weight_addr_conv55;
input wire [conv56_addr_WIDTH-1:0] weight_addr_conv56;
input wire [conv57_addr_WIDTH-1:0] weight_addr_conv57;
input wire [conv58_addr_WIDTH-1:0] weight_addr_conv58;
input wire [conv59_addr_WIDTH-1:0] weight_addr_conv59;
wire [N_adder_tree*18-1:0]   bias;

//BRAM1 output/input ports
wire  [N_BRAM1*16-1:0] BRAM1_out1,BRAM1_out2,BRAM_input1,BRAM_input2,BRAM1_input_LAYER_1,BRAM1_input_LAYER_2;
wire  [N_BRAM1*16-1:0] layer_input1,layer_input2;
//BRAM2 output/input ports
wire  [N_BRAM1*16-1:0] BRAM2_out1,BRAM2_out2,BRAM_skip_out1,BRAM_skip_out2;
wire  [N_adder_tree*16-1:0] BRAM_SKIP_out,BRAM1_out;
//and other signals
wire  [N_adder_tree*16-1:0] filter_output;
wire  [N_adder_tree*16-1:0] BRAM_after_padding,selected_input_bram;
//memory flags
wire  mem1_load,mem2_load;
wire [9:0]BRAM1_addr1_layer,BRAM1_addr2_layer,BRAMSKIP_addr1_layer,BRAMSKIP_addr2_layer,BRAM2_addr1_layer,BRAM2_addr2_layer;


assign BRAM1_out={BRAM1_out2,BRAM1_out1};
assign BRAM2_out={BRAM2_out2,BRAM2_out1};
assign BRAM_SKIP_out ={BRAM_skip_out2,BRAM_skip_out1};
assign BRAM_input1=filter_output[127:0];
assign BRAM_input2=filter_output[255:128];

assign layer_input1=INPUT_LAYER[127:0];
assign layer_input2=INPUT_LAYER[255:128];
//memory load signals 
assign mem1_load=(load&&(u==1||u==3))||WRITE||REG_WRITE;
assign mem2_load=load&&(u==2||u==0||u==4);


//controller

CONV55 conv55 (weight_out_conv55,weight_addr_conv55,clk);
CONV56 conv56 (weight_out_conv56,weight_addr_conv56,clk);
CONV57 conv57 (weight_out_conv57,weight_addr_conv57,clk);
CONV58 conv58 (weight_out_conv58,weight_addr_conv58,clk);
CONV59 conv59 (weight_out_conv59,weight_addr_conv59,clk);
//selection by "u" from 6 convolutions 
//module mux_weight_6_1  #(par (weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13,u,weight_out);

mux_weight_6_1   mux_weight_6_1_L11(weight_out_conv55,weight_out_conv56,weight_out_conv57,weight_out_conv58,weight_out_conv59,u,weight_out);

//which memory to read from (as input to the layer)   sel="u" 
mux_input_2_1 mux_input_2_1_L11 (selected_input_bram,BRAM1_out,BRAM2_out,u);
assign BRAM1_addr1_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR1 : BRAM1_addr1;
assign BRAM1_addr2_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR2 : BRAM1_addr2;
assign BRAMSKIP_addr1_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR1 : BRAM_skip_addr1;
assign BRAMSKIP_addr2_layer= (WRITE||REG_WRITE) ? REG_TRANS_ADDR2 : BRAM_skip_addr2;
assign BRAM1_input_LAYER_1= (WRITE||REG_WRITE) ? layer_input1 : BRAM_input1;
assign BRAM1_input_LAYER_2= (WRITE||REG_WRITE) ? layer_input2 : BRAM_input2;
//memory1
BRAM_layer11  memory1 (BRAM1_out1,BRAM1_out2,BRAM1_input_LAYER_1,BRAM1_input_LAYER_2,BRAM1_addr1_layer,BRAM1_addr2_layer,mem1_load,clk_mem); //8brams
BRAM_layer11  memory_skip (BRAM_skip_out1,BRAM_skip_out2,BRAM1_input_LAYER_1,BRAM1_input_LAYER_2,BRAMSKIP_addr1_layer,BRAMSKIP_addr2_layer,WRITE||REG_WRITE,clk_mem); //8brams
//padding 
mux_padding_2_1  mux_padding_2_1(BRAM_after_padding,padding,selected_input_bram);///

//BIAS_layer7 BIAS_layer7 (.q(bias));
BIAS_layer16 #(N_adder_tree) BIAS_layer12 (bias,z,u);
//16*16 filter
M_A_T16x16_L10_L16  M_A_T16x16_L11 (BRAM_after_padding,clk,rst,weight_out,bias,load||temp_zero_new,filter_output,BRAM_SKIP_out,u);//
//skip_connection memory

//memory2
BRAM_layer11  memory2 (BRAM2_out1,BRAM2_out2,BRAM_input1,BRAM_input2,BRAM2_addr1_layer,BRAM2_addr2_layer,mem2_load,clk_mem); //8brams
assign BRAM2_addr1_layer= (WRITE||REG_WRITE) ? TRANS_ADDR1 : BRAM2_addr1;
assign BRAM2_addr2_layer= (WRITE||REG_WRITE) ? TRANS_ADDR2 : BRAM2_addr2; 
endmodule
