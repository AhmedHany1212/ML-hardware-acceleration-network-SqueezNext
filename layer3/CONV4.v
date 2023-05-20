module CONV4 #(parameter N=16,parameter weight_addr_WIDTH=3)(weight_addr,clk,weight_out);
input wire [weight_addr_WIDTH-1:0] weight_addr;
input wire clk;
output wire [N*16-1:0] weight_out ;
W_ROM #(.FILENAME("conv4/CONV4_1.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U0 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(0+1)-1:16*0])); 
W_ROM #(.FILENAME("conv4/CONV4_2.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U1 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(1+1)-1:16*1])); 
W_ROM #(.FILENAME("conv4/CONV4_3.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U2 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(2+1)-1:16*2])); 
W_ROM #(.FILENAME("conv4/CONV4_4.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U3 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(3+1)-1:16*3])); 
W_ROM #(.FILENAME("conv4/CONV4_5.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U4 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(4+1)-1:16*4])); 
W_ROM #(.FILENAME("conv4/CONV4_6.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U5 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(5+1)-1:16*5])); 
W_ROM #(.FILENAME("conv4/CONV4_7.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U6 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(6+1)-1:16*6])); 
W_ROM #(.FILENAME("conv4/CONV4_8.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U7 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(7+1)-1:16*7])); 
W_ROM #(.FILENAME("conv4/CONV4_9.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U8 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(8+1)-1:16*8])); 
W_ROM #(.FILENAME("conv4/CONV4_10.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U9 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(9+1)-1:16*9])); 
W_ROM #(.FILENAME("conv4/CONV4_11.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U10 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(10+1)-1:16*10])); 
W_ROM #(.FILENAME("conv4/CONV4_12.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U11 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(11+1)-1:16*11])); 
W_ROM #(.FILENAME("conv4/CONV4_13.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U12 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(12+1)-1:16*12])); 
W_ROM #(.FILENAME("conv4/CONV4_14.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U13 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(13+1)-1:16*13])); 
W_ROM #(.FILENAME("conv4/CONV4_15.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U14 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(14+1)-1:16*14])); 
W_ROM #(.FILENAME("conv4/CONV4_16.txt"),.weight_addr_WIDTH(3),.NO_ROWS(8)) U15 (.weight_addr(weight_addr),.clk(clk),.weight_out(weight_out[16*(15+1)-1:16*15])); 


endmodule
