module BRAM2_address_L17(BRAM2_addr1,BRAM2_addr2,x_Reg5,y_Reg5,x,y,z,u,L,j);
output reg [9:0] BRAM2_addr1,BRAM2_addr2;
input [3:0] z;
input [2:0] u;
input [1:0] j;
input [2:0] x_Reg5,y_Reg5,x,y;
input [2:0] L;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={2'b0,x};
assign Y_5bits={2'b0,y};
assign XREG_5bits={2'b0,x_Reg5};
assign YREG_5bits={2'b0,y_Reg5};

always @ (*)
begin
		if (u==0||u==1)
			case ({u,z})
					7'b000_0001:begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)}; 					 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b00100};  	 	 	end 
					7'b000_0010:begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b01000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b01100}; 		  		end 
					7'b000_0011:begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10100}; 		  		end 
					7'b000_0100:begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11100}; 		  		end 
					7'b000_0101:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)}; 			 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b00100};		end 
					7'b000_0110:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b01000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b01100};		end 
					7'b000_0111:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b10000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b10100};		end 
					7'b000_1000:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b11000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b11100};		end 
					7'b000_1001:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)}; 			 BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b00100};  	  		end 
					7'b000_1010:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b01000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b01100};   end 
					7'b000_1011:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b10000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b10100};   end 
					7'b000_1100:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b11000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b11100};   end 
					7'b000_1101:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)}; 			 BRAM2_addr2={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b00100};	end 
					7'b000_1110:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b01000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b01100};	end 
					7'b000_1111:begin BRAM2_addr1={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b10000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b10100};	end 
					7'b001_0000:begin  BRAM2_addr1={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b11000};	 BRAM2_addr2={(XREG_5bits>>1)+5'b01100,(YREG_5bits>>1)+5'b11100};	end 					
					7'b001_0001:begin BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)}; 					     BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b00100};  	 	 	end 
					7'b001_0010:begin BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b01000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b01100}; 		  		end 
					7'b001_0011:begin BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10100}; 		  		end 
					7'b001_0100:begin BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11000}; 		 	 BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11100}; 		  		end 
					7'b001_0101:begin BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)}; 			 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b00100};		end 
					7'b001_0110:begin BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b01000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b01100};		end 
					7'b001_0111:begin BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b10000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b10100};		end 
					7'b000_0000:begin BRAM2_addr1={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b11000}; 	 BRAM2_addr2={(XREG_5bits>>1)+5'b00100,(YREG_5bits>>1)+5'b11100};		end 
					default :begin BRAM2_addr1=0; BRAM2_addr2=0;  end
			endcase	

		else if (u==5)
			case (z)
					1:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)}; 					 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b00100};  	 	 	end 
					2:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b01000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b01100}; 		  		end 
					3:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b10000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b10100}; 		  		end 
					4:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b11000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b11100}; 		  		end 
					5:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)}; 			 BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b00100};		end 
					6:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b01000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b01100};		end 
					7:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b10000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b10100};		end 
					8:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b11000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b11100};		end 
					9:begin BRAM2_addr1={(XREG_5bits)+5'b001000,(YREG_5bits)}; 			 BRAM2_addr2={(XREG_5bits)+5'b001000,(YREG_5bits)+5'b00100};  	  		end 
					10:begin BRAM2_addr1={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b01000};BRAM2_addr2={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b01100};   end 
					11:begin BRAM2_addr1={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b10000};BRAM2_addr2={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b10100};   end 
					12:begin BRAM2_addr1={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b11000};BRAM2_addr2={(XREG_5bits)+4'b1000,(YREG_5bits)+5'b11100};   end 
					13:begin BRAM2_addr1={(XREG_5bits)+4'b1100,(YREG_5bits)}; 			 BRAM2_addr2={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b00100};	end 
					14:begin BRAM2_addr1={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b01000};BRAM2_addr2={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b01100};	end 
					15:begin BRAM2_addr1={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b10000};BRAM2_addr2={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b10100};	end 
					0:begin BRAM2_addr1={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b11000};BRAM2_addr2={(XREG_5bits)+4'b1100,(YREG_5bits)+5'b11100};	end 					
					default :begin BRAM2_addr1=0; BRAM2_addr2=0;  end
			endcase	
		else if (u==3)
			case (z)
					1:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)}; 					 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b00100};  	 	 	end 
					2:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b01000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b01100}; 		  		end 
					3:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b10000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b10100}; 		  		end 
					4:begin BRAM2_addr1={(XREG_5bits),(YREG_5bits)+5'b11000}; 		 BRAM2_addr2={(XREG_5bits),(YREG_5bits)+5'b11100}; 		  		end 
					5:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)}; 			 BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b00100};		end 
					6:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b01000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b01100};		end 
					7:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b10000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b10100};		end 
					0:begin BRAM2_addr1={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b11000}; BRAM2_addr2={(XREG_5bits)+5'b00100,(YREG_5bits)+5'b11100};		end 
					default :begin BRAM2_addr1=0; BRAM2_addr2=0;  end
			endcase
		else if (u==4)
			case (L)
					0:begin BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits}; 						BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b00100};  		 end 
					1:begin BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits+5'b01000}; 			BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b01100}; 		 end 
					2:begin BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits+5'b10000}; 			BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b10100}; 		 end 
					3:begin BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits+5'b11000}; 			BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b11100}; 		 end 
					4:begin BRAM2_addr1={X_5bits+j-5'b00001+3'b100,Y_5bits}; 			BRAM2_addr2={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b00100};end 
					5:begin BRAM2_addr1={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b01000}; BRAM2_addr2={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b01100};end 
					6:begin BRAM2_addr1={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b10000}; BRAM2_addr2={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b10100};end 
					7:begin BRAM2_addr1={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b11000}; BRAM2_addr2={X_5bits+j-5'b00001+3'b100,Y_5bits+5'b11100};end 
					default :begin BRAM2_addr1=0; BRAM2_addr2=0;  end
			endcase			

		else
			case (L)
					0:begin BRAM2_addr1={X_5bits,Y_5bits}; 						BRAM2_addr2={X_5bits,Y_5bits+5'b00100};  		 end 
					1:begin BRAM2_addr1={X_5bits,Y_5bits+5'b01000}; 			BRAM2_addr2={X_5bits,Y_5bits+5'b01100}; 		 end 
					2:begin BRAM2_addr1={X_5bits,Y_5bits+5'b10000}; 			BRAM2_addr2={X_5bits,Y_5bits+5'b10100}; 		 end 
					3:begin BRAM2_addr1={X_5bits,Y_5bits+5'b11000}; 			BRAM2_addr2={X_5bits,Y_5bits+5'b11100}; 		 end 
					4:begin BRAM2_addr1={X_5bits+3'b100,Y_5bits}; 			BRAM2_addr2={X_5bits+3'b100,Y_5bits+5'b00100};end 
					5:begin BRAM2_addr1={X_5bits+3'b100,Y_5bits+5'b01000}; BRAM2_addr2={X_5bits+3'b100,Y_5bits+5'b01100};end 
					6:begin BRAM2_addr1={X_5bits+3'b100,Y_5bits+5'b10000}; BRAM2_addr2={X_5bits+3'b100,Y_5bits+5'b10100};end 
					7:begin BRAM2_addr1={X_5bits+3'b100,Y_5bits+5'b11000}; BRAM2_addr2={X_5bits+3'b100,Y_5bits+5'b11100};end 
					default :begin BRAM2_addr1=0; BRAM2_addr2=0;  end
			endcase			
			
end
endmodule

