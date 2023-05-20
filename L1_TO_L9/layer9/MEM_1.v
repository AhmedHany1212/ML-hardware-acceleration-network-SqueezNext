module MEM_1 #(parameter DATA_WIDTH = 16,ADDR_WIDTH = 10)(addr1,addr2,clk,q,wr,out);
input [(ADDR_WIDTH-1):0] addr1,addr2;
input clk,wr;
output reg [(DATA_WIDTH-1):0] out;
input   [(DATA_WIDTH-1):0] q;
reg [DATA_WIDTH-1:0] rom[0:1023];

always @ (posedge clk)
	begin	
		if(wr)
			rom[addr1]<=q; 
		out<=rom[addr2];			
	end
endmodule