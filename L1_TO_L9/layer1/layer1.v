module layer1(clk,rst,BRAM2_in,load,temp_zero,BRAM2_addr,temp_zero_new);
parameter N_weight_out=192;
parameter N_BRAM1=3;
parameter N_adder_tree=64;
parameter weight_addr_WIDTH=4;
parameter BRAM2_adder_width=10;
input clk,rst;
output [N_adder_tree*16-1:0]  			BRAM2_in;
output 	   load,temp_zero,temp_zero_new;
output [9:0] BRAM2_addr;

//input  [9:0]  tb_addr;
//input tb_choose,tb_load;
//output wire finish_f;
//output [47:0] CONV1_out_48;
//output [15:0] FILTER_out_16;
//output wire [N_adder_tree*16-1:0] BRAM2_out;
wire [9:0] BRAM1_addr;
wire [3:0] weight_addr;
wire [16*N_weight_out-1:0] weight_out;
wire [16*N_BRAM1-1:0] BRAM_out;
wire [18*N_adder_tree-1:0] bias;
wire temp_zero_new;
//assign CONV1_out_48= weight_out[47:0] ;
//assign FILTER_out_16=BRAM2_out[15:0];

//assign load_act = load&&!({x,y}==10'b0);
//assign mem2_addr = (tb_choose) ? tb_addr : BRAM2_addr;
//assign load_mem2 = (tb_choose) ? tb_load : load_act;
//assign finish_f  = (BRAM2_addr == 10'b11101_11101 && load_act == 1'b1) ? 1'b1 : 1'b0;

controller_layer1 controller_layer1(BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,temp_zero,temp_zero_new);
CONV1 #(N_weight_out,weight_addr_WIDTH) CONV1 (weight_addr,clk,weight_out);
BRAM_layer1 #(N_BRAM1) BRAM_layer1 (BRAM_out,BRAM1_addr,clk,rst);
M_A_T3x64_L1 #(N_adder_tree) M_A_T3x64 (BRAM_out,weight_out,bias,load||temp_zero_new,BRAM2_in,clk,rst);
BIAS_layer1 #(N_adder_tree) BIAS_layer1 (.q(bias));

endmodule