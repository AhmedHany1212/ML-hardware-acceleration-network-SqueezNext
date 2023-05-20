
module layer9(clk,rst,clk_mem,BRAM1_addr_in_L8,BRAM_L9_in,temp_zero_final,u_L8,ld_L8,filter_output,u,load,BRAM2_addr1,BRAM2_addr2,BRAM2_address_out,condition_L10);
        
//adder tree param
parameter N_weight_out=256;
parameter N_BRAM1=8; //=N_BRAM2
parameter N_adder_tree=16;

//convolution parameters
parameter conv19_addr_WIDTH=5;
parameter conv20_addr_WIDTH=4;
parameter conv21_addr_WIDTH=3;
parameter conv22_addr_WIDTH=5;
parameter conv23_addr_WIDTH=6;
parameter conv24_addr_WIDTH=5;

// i/o ports 
input clk,rst,clk_mem,ld_L8;
input wire [9:0] BRAM1_addr_in_L8;
output wire condition_L10,temp_zero_final;
input wire [2:0] u_L8;
input wire [N_adder_tree*16-1:0] BRAM_L9_in;
output wire  [N_adder_tree*16-1:0] filter_output;
output wire [2:0] u;
output wire  load;
output wire [9:0]BRAM2_addr1,BRAM2_addr2,BRAM2_address_out;
//Bram addresses
wire [9:0]BRAM1_addr,BRAM_skip_addr1,BRAM_skip_addr2,BRAM1_addr_L9;
wire [N_BRAM1*16-1:0] BRAM_skip_out1,BRAM_skip_out2;
//conntroller counters and parameters 
wire [2:0] u_Reg1,u_Reg5,u_Reg3,z;
wire [1:0] L;

//convolutions data and variables
wire [N_weight_out*16-1:0] weight_out,weight_out_conv19,weight_out_conv20,weight_out_conv21;
wire [N_weight_out*16-1:0] weight_out_conv22,weight_out_conv23,weight_out_conv24 ;
wire [conv19_addr_WIDTH-1:0] weight_addr_conv19;
wire [conv20_addr_WIDTH-1:0] weight_addr_conv20;
wire [conv21_addr_WIDTH-1:0] weight_addr_conv21;
wire [conv22_addr_WIDTH-1:0] weight_addr_conv22;
wire [conv23_addr_WIDTH-1:0] weight_addr_conv23;
wire [conv24_addr_WIDTH-1:0] weight_addr_conv24;
wire [N_adder_tree*18-1:0]   bias;

//BRAM1 output/input ports
wire  [N_adder_tree*16-1:0] BRAM1_out;
//BRAM2 output/input ports
wire  [N_BRAM1*16-1:0] BRAM2_out1,BRAM2_out2,BRAM_input2,BRAM_input1;
wire  [N_adder_tree*16-1:0] BRAM2_out,BRAM_SKIP_out;
//and other signals
wire  [N_adder_tree*16-1:0] BRAM1_DATA_L9;
wire  [N_adder_tree*16-1:0] BRAM_after_padding,selected_input_bram;
//memory flags
wire  mem1_load,mem2_load,skip_connection_load,temp_zero;
 

assign BRAM2_out={BRAM2_out2,BRAM2_out1};
assign BRAM_SKIP_out={BRAM_skip_out2,BRAM_skip_out1};

assign BRAM_input1=filter_output[127:0];
assign BRAM_input2=filter_output[255:128];

//memory load signals 
assign mem1_load=load&&(u==2||u==4);
assign mem2_load=load&&(u_Reg5==1||u==3);
assign skip_connection_load=load&&u_Reg5==0;

assign condition_L10=(BRAM2_addr1==785&&u==5&&L==1);
assign temp_zero_final=(temp_zero&&u==5);


//controller
cont_layer9 cont_layer9(BRAM2_addr1,BRAM2_addr2,BRAM1_addr,clk,rst,u,u_Reg1,u_Reg5,u_Reg3,load,weight_addr_conv19,weight_addr_conv20,weight_addr_conv21,weight_addr_conv22,weight_addr_conv23,weight_addr_conv24,temp_zero_new,padding,z,BRAM_skip_addr1,BRAM_skip_addr2,temp_zero,BRAM2_address_out,L);
//convolution memory -->fetch conv_weigths
CONV19 conv19 (weight_out_conv19,weight_addr_conv19,clk);
CONV20 conv20 (weight_out_conv20,weight_addr_conv20,clk);
CONV21 conv21 (weight_out_conv21,weight_addr_conv21,clk);
CONV22 conv22 (weight_out_conv22,weight_addr_conv22,clk);
CONV23 conv23 (weight_out_conv23,weight_addr_conv23,clk);
CONV24 conv24 (weight_out_conv24,weight_addr_conv24,clk);
//selection by "u" from 6 convolutions 
mux_weight_6_1_L9   mux_weight_6_1(weight_out_conv19,weight_out_conv20,weight_out_conv21,weight_out_conv22,weight_out_conv23,weight_out_conv24,u_Reg1,weight_out);


mux_input_2_1_L9 mux_input_2_1 (selected_input_bram,BRAM1_out,BRAM2_out,u);
assign BRAM1_addr_L9= (u_L8==4) ? BRAM1_addr_in_L8:BRAM1_addr;
assign BRAM1_DATA_L9= (u_L8==4) ? BRAM_L9_in:filter_output;

BRAM_L9_1 memory1(BRAM1_addr_L9,BRAM1_addr,clk_mem,BRAM1_DATA_L9,(ld_L8&&u_L8==4)||mem1_load,BRAM1_out);

BRAM_L9_2  skip_connection (BRAM_skip_out1,BRAM_skip_out2,BRAM_input1,BRAM_input2,BRAM_skip_addr1,BRAM_skip_addr2,skip_connection_load,clk); //8brams

BRAM_L9_2  memory2 (BRAM2_out1,BRAM2_out2,BRAM_input1,BRAM_input2,BRAM2_addr1,BRAM2_addr2,mem2_load,clk); //8brams

mux_padding_2_1_L9  mux_padding_2_1(BRAM_after_padding,padding,selected_input_bram);///

BIAS_layer9  #(N_adder_tree) BIAS_layer9 (bias,z,u_Reg3);

M_A_T16x16_L9  M_A_T16x16 (BRAM_after_padding,clk,rst,weight_out,bias,load||temp_zero_new,filter_output,BRAM_SKIP_out,u);//
//skip_connection memory

endmodule

















