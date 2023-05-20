module BRAM_SKIP_address_L7(z,u,x_Reg4,y_Reg4,BRAM2_addr,BRAM_skip_addr);

output reg [9:0] BRAM_skip_addr;
input [9:0] BRAM2_addr;
input [1:0] z;
input [2:0] u;
input [4:0] x_Reg4,y_Reg4;

always @ (*)
begin
  if(u==5)
	 begin
		  case (z)
			2'b10: BRAM_skip_addr={x_Reg4,y_Reg4}; 
			2'b11: BRAM_skip_addr={x_Reg4,y_Reg4+5'b10000}; 
			2'b00: BRAM_skip_addr={x_Reg4+5'b10000,y_Reg4}; 
			2'b01: BRAM_skip_addr={x_Reg4+5'b10000,y_Reg4+5'b10000}; 
		 endcase	
	 end	 		
  else
	 BRAM_skip_addr=BRAM2_addr;
end
endmodule
