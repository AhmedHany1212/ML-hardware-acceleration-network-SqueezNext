module MEM_TRANS (clk,BRAM2_addr_L1,BRAM1_addr_L2,in,W_En,R_En,out);
input clk,W_En,R_En;
input [9:0] BRAM2_addr_L1,BRAM1_addr_L2;
input [15:0] in;
output reg [15:0] out;

reg [15:0] ram[0:1023];
always @ (posedge clk)
	begin	
		if(W_En)
			ram[BRAM2_addr_L1]<=in;
		if (R_En)  
			out<=ram[BRAM1_addr_L2];
	end
endmodule
