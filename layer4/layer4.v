module layer4(clk,rst,BRAM_out1,BRAM_out2,BRAM2_in,temp_zero,BRAM1_addr,BRAM2_addr,WE_1,WE_2);
parameter N_weight_out=32; //64filters * 3 inputs       ==  4*8
parameter N_BRAM1=4;  //8*(bram_size=32*32)
parameter N_adder_tree=8; //8filters  
parameter weight_addr_WIDTH=4;  //>>>>>>>>>>>>>>>>>>>>>  log2(number of conv lines in file)
parameter BRAM2_adder_width=10; 
 
input clk,rst;
input wire [16*4-1:0] BRAM_out1,BRAM_out2;
output wire [N_adder_tree*16-1:0] BRAM2_in;
output wire WE_1,WE_2;
output wire [9:0] BRAM1_addr,BRAM2_addr;
assign WE_1=load&&Z;
assign WE_2=load&&!Z&&!temp_zero_new;
wire  L,load;
//wire [2:0] R;
wire [4:0] y_Reg;
wire [3:0] weight_addr;
wire 		  Z,temp_zero_new;
wire [16*N_weight_out-1:0] weight_out;
wire [16*4-1:0] BRAM_out,Bram_addertree_input;
wire [18*N_adder_tree-1:0] bias;
//wire [N_adder_tree*16-1:0]  			BRAM2_in ;
wire    [1:0]   k_Reg;
wire   sel;
output wire temp_zero;
//controller_layer4						 (L,z,k,x,y,BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,z_zero);
  controller_layer4 controller_layer4(L,Z,k_Reg,y_Reg,BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,temp_zero_new,temp_zero);
//controller_layer3 controller_layer3(L,Z,R,x,y,BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst);

  CONV5 #(N_weight_out,weight_addr_WIDTH) CONV5 (weight_addr,clk,weight_out);
//CONV4 #(N_weight_out,weight_addr_WIDTH) CONV4 (weight_addr,clk,weight_out);

//BRAM_layer4_1 #(.N_BRAM1(4)) BRAM_layer4_1 (BRAM_out1,BRAM1_addr,clk,rst);
//BRAM_layer4_2 #(.N_BRAM1(4)) BRAM_layer4_2 (BRAM_out2,BRAM1_addr,clk,rst);
mux2_1 #(.data_width(4),.data_size(16)) mux2_1_1  (BRAM_out1,BRAM_out2,!L,BRAM_out);

assign sel= (y_Reg+k_Reg==0) || (y_Reg+k_Reg==31);
mux2_1 #(.data_width(4),.data_size(16)) mux2_1_2 (BRAM_out,64'b0,sel,Bram_addertree_input);


//BIAS_layer4_1 #(N_adder_tree) BIAS_layer4_1 (bias1);
//BIAS_layer4_2 #(N_adder_tree) BIAS_layer4_2 (bias2);
//mux2_1  #(.data_width(8),.data_size(18)) mux2_1_3(bias1,bias2,Z,bias);//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

BIAS_layer4 #(N_adder_tree) BIAS_layer4_1 (bias,!Z);

  M_A_T4x8_L4 #(N_adder_tree)    M_A_T4x8  (Bram_addertree_input,clk,rst,weight_out,bias,load||temp_zero_new,BRAM2_in);

//Demux1_2  Demux1_2   (BRAM2_in_b1,BRAM2_in_b2,BRAM2_in,!Z);

//MEM_L4_2 #(N_adder_tree,BRAM2_adder_width) MEM_L4_2_1 (BRAM2_addr,clk,BRAM2_in_b1,load&&Z,BRAM2_out1);
//MEM_L4_2 #(N_adder_tree,BRAM2_adder_width) MEM_L4_2_2 (BRAM2_addr,clk,BRAM2_in_b2,load&&!Z&&!temp_zero_new,BRAM2_out2);

endmodule
