//we have 192 distributed rom each one has different 11 num(9 and 2 padding) so we need 192 num at time (192*16 bits)

module CONV7 #(parameter N_weight_out=16,parameter weight_addr_WIDTH=5)(weight_addr,clk,weight_out);
input wire [weight_addr_WIDTH-1:0] weight_addr;
input clk;
output wire [N_weight_out*16-1:0] weight_out ;
W_ROM #(.FILENAME("conv7/CONV7_1.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U0 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(0+1)-1:16*0])); 
W_ROM #(.FILENAME("conv7/CONV7_2.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U1 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(1+1)-1:16*1])); 
W_ROM #(.FILENAME("conv7/CONV7_3.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U2 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(2+1)-1:16*2])); 
W_ROM #(.FILENAME("conv7/CONV7_4.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U3 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(3+1)-1:16*3])); 
W_ROM #(.FILENAME("conv7/CONV7_5.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U4 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(4+1)-1:16*4])); 
W_ROM #(.FILENAME("conv7/CONV7_6.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U5 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(5+1)-1:16*5])); 
W_ROM #(.FILENAME("conv7/CONV7_7.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U6 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(6+1)-1:16*6])); 
W_ROM #(.FILENAME("conv7/CONV7_8.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U7 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(7+1)-1:16*7])); 
W_ROM #(.FILENAME("conv7/CONV7_9.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U8 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(8+1)-1:16*8])); 
W_ROM #(.FILENAME("conv7/CONV7_10.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U9 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(9+1)-1:16*9])); 
W_ROM #(.FILENAME("conv7/CONV7_11.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U10 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(10+1)-1:16*10])); 
W_ROM #(.FILENAME("conv7/CONV7_12.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U11 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(11+1)-1:16*11])); 
W_ROM #(.FILENAME("conv7/CONV7_13.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U12 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(12+1)-1:16*12])); 
W_ROM #(.FILENAME("conv7/CONV7_14.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U13 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(13+1)-1:16*13])); 
W_ROM #(.FILENAME("conv7/CONV7_15.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U14 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(14+1)-1:16*14])); 
W_ROM #(.FILENAME("conv7/CONV7_16.txt"),.weight_addr_WIDTH(5) ,.NO_ROWS(32)) U15 (.weight_addr(weight_addr), .clk(clk),.weight_out(weight_out[16*(15+1)-1:16*15])); 

endmodule
