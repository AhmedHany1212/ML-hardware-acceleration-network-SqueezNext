module MEM #(parameter FILENAME = "rom_init.txt",DATA_WIDTH = 16,BRAM1_addr_WIDTH = 10)(BRAM_out,BRAM1_addr,clk,rst);
output reg [(DATA_WIDTH-1):0] BRAM_out;
input [(BRAM1_addr_WIDTH-1):0] BRAM1_addr;
input clk,rst;
reg [DATA_WIDTH-1:0] rom[0:2**BRAM1_addr_WIDTH-1];

 always @(posedge clk or negedge rst)
	begin	
   if (!rst) begin
   	BRAM_out<=16'b0000000000000000;  end
	else 
		BRAM_out<=rom[BRAM1_addr];
	end

initial
	begin
		$readmemb(FILENAME, rom);
	end
endmodule

