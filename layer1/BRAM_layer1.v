//we have 3 BRAMs each one has different 1024 num so we need 3 num at time (3*16 bits)
module BRAM_layer1 #(parameter N_BRAM1=3)(BRAM_out,BRAM1_addr,clk,rst);
 output  [N_BRAM1*16-1:0]        BRAM_out;
 input  [10-1:0] 				BRAM1_addr;
 input 			    		   clk,rst;

MEM #(.FILENAME("data_in/rom_init_1.txt"),.DATA_WIDTH(16),.BRAM1_addr_WIDTH(10)) U0 (.BRAM1_addr(BRAM1_addr), .clk(clk),.rst(rst),.BRAM_out(BRAM_out[16*(0+1)-1:16*0])); 
MEM #(.FILENAME("data_in/rom_init_2.txt"),.DATA_WIDTH(16),.BRAM1_addr_WIDTH(10)) U1 (.BRAM1_addr(BRAM1_addr), .clk(clk),.rst(rst),.BRAM_out(BRAM_out[16*(1+1)-1:16*1])); 
MEM #(.FILENAME("data_in/rom_init_3.txt"),.DATA_WIDTH(16),.BRAM1_addr_WIDTH(10)) U2 (.BRAM1_addr(BRAM1_addr), .clk(clk),.rst(rst),.BRAM_out(BRAM_out[16*(2+1)-1:16*2])); 

endmodule
