module W_ROM #(parameter FILENAME = "w_init.txt",parameter weight_addr_WIDTH=3,parameter NO_ROWS=11)(weight_addr,clk,weight_out);  
input wire [weight_addr_WIDTH-1:0] weight_addr;
output reg [16-1:0] weight_out ;
input clk;
(* rom_style =  "distributed" *) reg [16-1:0] rom[0:NO_ROWS-1];  
initial 
	begin   
		$readmemb(FILENAME, rom);  
	end 
always @ (posedge clk)
	begin
		weight_out <= rom[weight_addr]; 
	end	
endmodule
