module MEM_L9_2 #(parameter DATA_WIDTH = 16,BRAM_addr_WIDTH = 10)(BRAM1_out1,BRAM1_out2,BRAM1_in1,BRAM1_in2,BRAM1_addr1,BRAM1_addr2,wr,clk);
output reg [(DATA_WIDTH-1):0] BRAM1_out1,BRAM1_out2;
input [(DATA_WIDTH-1):0] BRAM1_in1,BRAM1_in2;
input [(BRAM_addr_WIDTH-1):0] BRAM1_addr1,BRAM1_addr2;
input clk,wr;
reg [DATA_WIDTH-1:0] ram[0:2**BRAM_addr_WIDTH-1];

 always @(posedge clk )
	begin	
		if(wr)
			ram[BRAM1_addr1]<=BRAM1_in1;
		else 
			BRAM1_out1 <= ram[BRAM1_addr1];
	end
 always @(posedge clk )
	begin
		if(wr)
			ram[BRAM1_addr2]<=BRAM1_in2;
		else 
			BRAM1_out2 <= ram[BRAM1_addr2];
	
	end
endmodule