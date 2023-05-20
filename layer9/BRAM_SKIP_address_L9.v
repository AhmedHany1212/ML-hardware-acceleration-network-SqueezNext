module BRAM_SKIP_address_L9(z,u,x_Reg4,y_Reg4,BRAM2_addr1,BRAM2_addr2,BRAM_skip_addr1,BRAM_skip_addr2);
output reg [9:0] BRAM_skip_addr1,BRAM_skip_addr2;
input [9:0] BRAM2_addr1,BRAM2_addr2;
input [2:0] u,z;
input [3:0] x_Reg4,y_Reg4;
wire [4:0] XREG_5bits,YREG_5bits;
assign XREG_5bits={1'b0,x_Reg4};
assign YREG_5bits={1'b0,y_Reg4};
always @ (*)
	begin
	 if (u==5)
		case(z)
			   1: begin  BRAM_skip_addr1={XREG_5bits,YREG_5bits}; 			        BRAM_skip_addr2={XREG_5bits,YREG_5bits+5'b01000}; 				     end
				2: begin BRAM_skip_addr1={XREG_5bits,YREG_5bits+5'b10000}; 	        BRAM_skip_addr2={XREG_5bits,YREG_5bits+5'b11000}; 				     end
				3: begin BRAM_skip_addr1={XREG_5bits+5'b01000,YREG_5bits}; 		    BRAM_skip_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 		  end
				4: begin BRAM_skip_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; BRAM_skip_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 		  end	
			   5: begin  BRAM_skip_addr1={XREG_5bits+5'b10000,YREG_5bits}; 			BRAM_skip_addr2={XREG_5bits+5'b10000,YREG_5bits+5'b01000}; 		  end
				6: begin BRAM_skip_addr1={XREG_5bits+5'b10000,YREG_5bits+5'b10000}; BRAM_skip_addr2={XREG_5bits+5'b10000,YREG_5bits+5'b11000}; 		  end	
				7: begin BRAM_skip_addr1={XREG_5bits+5'b11000,YREG_5bits}; 			BRAM_skip_addr2={XREG_5bits+5'b11000,YREG_5bits+5'b01000}; 		  end
				0: begin BRAM_skip_addr1={XREG_5bits+5'b11000,YREG_5bits+5'b10000}; BRAM_skip_addr2={XREG_5bits+5'b11000,YREG_5bits+5'b11000};         end					
		endcase
	else 
	begin BRAM_skip_addr1=BRAM2_addr1; BRAM_skip_addr2=BRAM2_addr2; end
	end

endmodule