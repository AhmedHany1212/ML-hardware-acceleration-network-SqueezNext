module MEM2_L7 (clk,BRAM2_addr,q,wr,out);
input clk,wr;
input [9:0] BRAM2_addr;
input [15:0] q;
output reg [15:0] out;

reg [15:0] rom[0:1023];
always @ (posedge clk)
	begin	
		if(wr)
			rom[BRAM2_addr]<=q;
		else 
			out<=rom[BRAM2_addr];
	end
	
endmodule
