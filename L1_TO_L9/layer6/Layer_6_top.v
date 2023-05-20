module layer6 (clk,rst,mem_out_4,in_skip_L6,BRAM_SKIP_addr,mem1_addr,mem2_addr,temp_zero,depth_mem_out,mem_in_4,temp_zero_new);
 input  wire    		 clk,rst;
 input  wire [16*16-1:0] mem_out_4;
 input wire [16*16-1:0] in_skip_L6;
 output wire [9:0] 	     mem1_addr,BRAM_SKIP_addr,mem2_addr;
 output wire temp_zero;
 output wire [2:0] 	   depth_mem_out;
 output wire [4*16-1:0]   mem_in_4;
 wire [1:0]        depth_mem_in;
  output wire temp_zero_new;


 wire              temp_5,load_act;
 wire [4:0] 	   w_addr;
 wire [4*16-1:0]   in_skip;              
 wire [71:0]       bias_out;
 wire [4*4*16-1:0] Weight_out_4x4;
 reg [16*4-1:0] MEM_out;
 assign load_act =  depth_mem_in == 3 ;

// assign load_mem2 =load_act && ! temp_zero_new;
 in_skip_address in_skip_address(in_skip_L6,depth_mem_out,in_skip);
 
 always @(*)
 begin
 case (depth_mem_in)
	 1:  MEM_out = mem_out_4[(3+1)*16-1:0*16];
	 2:  MEM_out = mem_out_4[(7+1)*16-1:4*16];
	 3:  MEM_out = mem_out_4[(11+1)*16-1:8*16];
	 0:  MEM_out = mem_out_4[(15+1)*16-1:12*16];
endcase
 end
 

 
 //----------------instantiDSFSGDFHations-------------//
 
 // instantiate controller
 controller_layer6 cont_L6(
  .clk(clk),
  .rst(rst),
  .z(depth_mem_out),
  .BRAM1_addr(mem1_addr),
  .address_act(mem2_addr),
  .weight_addr(w_addr),
  .L(depth_mem_in),
  .temp_zero_new(temp_zero_new),
  .temp_5(temp_5),
  .temp_zero(temp_zero),
  .BRAM_SKIP_addr(BRAM_SKIP_addr)
  );
 
 // insatntiate MEM1
 /*
 MEM1 memory_1(
  .clk(clk),
  .rst(rst),
  .address(mem1_addr),
  .chose_mem(depth_mem_in),
  .MEM_out(MEM_out)
 );
 */
 // instantiate MEM2

 //instantiate weight memory conv7
 CONV7 W_mem(
  .weight_addr(w_addr),
  .clk(clk),
  .weight_out(Weight_out_4x4) 
  );
 /* 
 MEM2_L6 memory_2(
  .clk(clk),
  .wr(load_mem2),
  .address(mem2_addr),
  .chose_mem(depth_mem_out),
  .MEM_in(mem_in_4),
  .MEM_out(layer6_out)
 );*/
 
 // instantiate M_A_T8x8
 M_A_T4x4_L6 MAT4x4(
  .data_in(MEM_out),
  .clk(clk),
  .rst(rst),
  .weight(Weight_out_4x4),
  .bias(bias_out),
  .load(load_act || temp_5),
  .out_filter(mem_in_4),
  .in_skip(in_skip)
 );
 
 
 //instantiate bais_rom
 bias_rom bias_rom(
  .bias_out(bias_out),
  .bias_add(depth_mem_out),
  .clk(clk)
 );
 
endmodule 