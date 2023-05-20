module BRAM1_addr_L9(BRAM1_addr,L,x_Reg5,y_Reg5,x,y,u,k,z);
output reg[9:0] BRAM1_addr;
input [3:0] x_Reg5,y_Reg5,x,y;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={1'b0,x};
assign Y_5bits={1'b0,y};
assign XREG_5bits={1'b0,x_Reg5};
assign YREG_5bits={1'b0,y_Reg5};
input [1:0] L;
input [1:0] k;
input [2:0] u,z;



always @ (*)
	begin
	if ((u==5) )
		case (L)
				2'b00:   BRAM1_addr={X_5bits,Y_5bits}; 			
				2'b01:   BRAM1_addr={X_5bits,Y_5bits+5'b01000}; 
				2'b10:   BRAM1_addr={X_5bits,Y_5bits+5'b10000}; 
				2'b11:   BRAM1_addr={X_5bits,Y_5bits+5'b11000}; 
		endcase
	else if (u==0||u==1)
		case (L)
				2'b00:   BRAM1_addr={X_5bits,Y_5bits}; 			
				2'b01:   BRAM1_addr={X_5bits,Y_5bits+5'b10000}; 
				2'b10:   BRAM1_addr={X_5bits+5'b10000,Y_5bits}; 
				2'b11:   BRAM1_addr={X_5bits+5'b10000,Y_5bits+5'b10000}; 
		endcase
	else if (u==3)
		
		case (L)
				2'b00:   BRAM1_addr={X_5bits,Y_5bits+k-5'b00001}; 			
				2'b01:   BRAM1_addr={X_5bits,Y_5bits+5'b01000+k-5'b00001};
				2'b10:   BRAM1_addr={X_5bits,Y_5bits+5'b10000+k-5'b00001};
				2'b11:   BRAM1_addr={X_5bits,Y_5bits+5'b11000+k-5'b00001};
		endcase		
	else if (u==4)
		case(z)
				3'b001:   BRAM1_addr={XREG_5bits,YREG_5bits}; 			
				3'b010:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b01000}; 
				3'b011:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b10000}; 
				3'b000:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b11000}; 
				default:  BRAM1_addr=0; 	  
		endcase
		
	else
		case(z)
			 0:   BRAM1_addr={XREG_5bits,YREG_5bits}; 			
			 1:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b01000}; 	
			 default:  BRAM1_addr=0; 	  
		endcase


	end




endmodule
