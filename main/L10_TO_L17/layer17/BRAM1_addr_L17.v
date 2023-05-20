module BRAM1_addr_L17(BRAM1_addr1,BRAM1_addr2,L,x_Reg5,y_Reg5,x,y,u,k,z);
output reg[9:0] BRAM1_addr1,BRAM1_addr2;
input [2:0] x_Reg5,y_Reg5,x,y;
input [2:0] L;
input [1:0] k;
input [3:0] z;
input [2:0] u;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={2'b0,x};
assign Y_5bits={2'b0,y};
assign XREG_5bits={2'b0,x_Reg5};
assign YREG_5bits={2'b0,y_Reg5};
always @ (*)
	begin
		if(u==0||u==1)
			case (L)
					0:begin BRAM1_addr1={X_5bits,Y_5bits}; 					  BRAM1_addr2={X_5bits,Y_5bits+5'b01000};  	  end 
					1:begin BRAM1_addr1={X_5bits,Y_5bits+5'b10000}; 		  BRAM1_addr2={X_5bits,Y_5bits+5'b11000}; 		  end 
					2:begin BRAM1_addr1={X_5bits+5'b01000,Y_5bits}; 		  BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b01000};  	  end 
					3:begin BRAM1_addr1={X_5bits+5'b01000,Y_5bits+5'b10000};  BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b11000}; 		  end 
					4:begin BRAM1_addr1={X_5bits+5'b10000,Y_5bits}; 		  BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b01000};  	  end 
					5:begin BRAM1_addr1={X_5bits+5'b10000,Y_5bits+5'b10000};  BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b11000}; 		  end 
					6:begin BRAM1_addr1={X_5bits+5'b11000,Y_5bits}; 			  BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b01000};  	  end 
					7:begin BRAM1_addr1={X_5bits+5'b11000,Y_5bits+5'b10000};   BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b11000}; 		  end 
					default:begin BRAM1_addr1=0; BRAM1_addr2=0; end 
		
		endcase
		else if(u==5)
			case (L)
					0:begin BRAM1_addr1={X_5bits,Y_5bits}; 					  BRAM1_addr2={X_5bits,Y_5bits+5'b00100};  	  end 
					1:begin BRAM1_addr1={X_5bits,Y_5bits+5'b01000}; 		  BRAM1_addr2={X_5bits,Y_5bits+5'b01100}; 		  end 
					2:begin BRAM1_addr1={X_5bits,Y_5bits+5'b10000}; 		  BRAM1_addr2={X_5bits,Y_5bits+5'b10100}; 		  end 
					3:begin BRAM1_addr1={X_5bits,Y_5bits+5'b11000}; 		  BRAM1_addr2={X_5bits,Y_5bits+5'b11100}; 		  end 
					4:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits}; 		  BRAM1_addr2={X_5bits+3'b100,Y_5bits+5'b00100};end 
					5:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+5'b01000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+5'b01100};end 
					6:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+5'b10000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+5'b10100};end 
					7:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+5'b11000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+5'b11100};end 
					default:begin BRAM1_addr1=0; BRAM1_addr2=0; end 
		
		endcase
		else if(u==3)
			case (L)
					0:begin BRAM1_addr1={X_5bits,Y_5bits+k-5'b00001}; 					  BRAM1_addr2={X_5bits,Y_5bits+k-5'b00001+5'b00100};  	  end 
					1:begin BRAM1_addr1={X_5bits,Y_5bits+k-5'b00001+5'b01000}; 		  BRAM1_addr2={X_5bits,Y_5bits+k-5'b00001+5'b01100}; 		  end 
					2:begin BRAM1_addr1={X_5bits,Y_5bits+k-5'b00001+5'b10000}; 		  BRAM1_addr2={X_5bits,Y_5bits+k-5'b00001+5'b10100}; 		  end 
					3:begin BRAM1_addr1={X_5bits,Y_5bits+k-5'b00001+5'b11000}; 		  BRAM1_addr2={X_5bits,Y_5bits+k-5'b00001+5'b11100}; 		  end 
					4:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+k-5'b00001}; 			  BRAM1_addr2={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b00100};end 
					5:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b01000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b01100};end 
					6:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b10000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b10100};end 
					7:begin BRAM1_addr1={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b11000}; BRAM1_addr2={X_5bits+3'b100,Y_5bits+k-5'b00001+5'b11100};end 
					default:begin BRAM1_addr1=0; BRAM1_addr2=0; end 

			endcase					
		else if (u==2)
			case (z)
					1:begin BRAM1_addr1={XREG_5bits,YREG_5bits}; 					 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b00100};  	  end 
					2:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b01000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b01100}; 		  end 
					3:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b10000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b10100}; 		  end 
					0:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b11000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b11100}; 		  end 
					default:begin BRAM1_addr1=0; BRAM1_addr2=0; end 
			endcase		
		else 	
			case (z)
					1:begin BRAM1_addr1={XREG_5bits,YREG_5bits}; 					 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b00100};  	  end 
					2:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b01000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b01100}; 		  end 
					3:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b10000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b10100}; 		  end 
					4:begin BRAM1_addr1={XREG_5bits,YREG_5bits+5'b11000}; 		 BRAM1_addr2={XREG_5bits,YREG_5bits+5'b11100}; 		  end 
					5:begin BRAM1_addr1={XREG_5bits+3'b100,YREG_5bits}; 			 BRAM1_addr2={XREG_5bits+3'b100,YREG_5bits+5'b00100};end 
					6:begin BRAM1_addr1={XREG_5bits+3'b100,YREG_5bits+5'b01000}; BRAM1_addr2={XREG_5bits+3'b100,YREG_5bits+5'b01100};end 
					7:begin BRAM1_addr1={XREG_5bits+3'b100,YREG_5bits+5'b10000}; BRAM1_addr2={XREG_5bits+3'b100,YREG_5bits+5'b10100};end 
					0:begin BRAM1_addr1={XREG_5bits+3'b100,YREG_5bits+5'b11000}; BRAM1_addr2={XREG_5bits+3'b100,YREG_5bits+5'b11100};end 	
					default:begin BRAM1_addr1=0; BRAM1_addr2=0; end 
			endcase		
	end
endmodule
