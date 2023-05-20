module MEM_L8_1 #(parameter M=16)(addr1,addr2,clk,q,wr,out);
 input  [10-1:0] addr1,addr2;
 input wr,clk;
input  [M*16-1:0] q;
output [M*16-1:0] out;

MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U0 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(0+1)-1:16*0]),.wr(wr),.out(out[16*(0+1)-1:16*0])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U1 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(1+1)-1:16*1]),.wr(wr),.out(out[16*(1+1)-1:16*1])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U2 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(2+1)-1:16*2]),.wr(wr),.out(out[16*(2+1)-1:16*2])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U3 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(3+1)-1:16*3]),.wr(wr),.out(out[16*(3+1)-1:16*3])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U4 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(4+1)-1:16*4]),.wr(wr),.out(out[16*(4+1)-1:16*4])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U5 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(5+1)-1:16*5]),.wr(wr),.out(out[16*(5+1)-1:16*5])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U6 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(6+1)-1:16*6]),.wr(wr),.out(out[16*(6+1)-1:16*6])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U7 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(7+1)-1:16*7]),.wr(wr),.out(out[16*(7+1)-1:16*7])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U8 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(8+1)-1:16*8]),.wr(wr),.out(out[16*(8+1)-1:16*8])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U9 (.addr1(addr1), .addr2(addr2),.clk(clk),.q(q[16*(9+1)-1:16*9]),.wr(wr),.out(out[16*(9+1)-1:16*9])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U10 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(10+1)-1:16*10]),.wr(wr),.out(out[16*(10+1)-1:16*10])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U11 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(11+1)-1:16*11]),.wr(wr),.out(out[16*(11+1)-1:16*11])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U12 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(12+1)-1:16*12]),.wr(wr),.out(out[16*(12+1)-1:16*12])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U13 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(13+1)-1:16*13]),.wr(wr),.out(out[16*(13+1)-1:16*13])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U14 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(14+1)-1:16*14]),.wr(wr),.out(out[16*(14+1)-1:16*14])); 
MEM_L8 #(.DATA_WIDTH(16),.ADDR_WIDTH(10) ) U15 (.addr1(addr1), .addr2(addr2),.clk(clk), .q(q[16*(15+1)-1:16*15]),.wr(wr),.out(out[16*(15+1)-1:16*15])); 

endmodule
