module BRAM_SKIP_address_L8(z,u,x_Reg4,y_Reg4,BRAM1_addr,BRAM_skip_addr);

output reg [9:0] BRAM_skip_addr;
input [9:0] BRAM1_addr;
input [1:0] z;
input [2:0] u;
input [4:0] x_Reg4,y_Reg4;

always @ (*)
	begin
		if(u==4)
			case (z)
				2'b10: BRAM_skip_addr={x_Reg4,y_Reg4}; 
				2'b11: BRAM_skip_addr={x_Reg4,y_Reg4+5'b10000}; 
				2'b00: BRAM_skip_addr={x_Reg4+5'b10000,y_Reg4}; 
				2'b01: BRAM_skip_addr={x_Reg4+5'b10000,y_Reg4+5'b10000}; 
			endcase	
		else
			BRAM_skip_addr=BRAM1_addr;	
	end
endmodule
