module BRAM2_asddress_L9(BRAM2_address_out,L,x_Reg5,y_Reg5,x,y,u,j,z );
output reg[9:0] BRAM2_address_out;
input [3:0] x_Reg5,y_Reg5,x,y;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={1'b0,x};
assign Y_5bits={1'b0,y};
assign XREG_5bits={1'b0,x_Reg5};
assign YREG_5bits={1'b0,y_Reg5};
input [1:0] L;
input [1:0] j;
input [2:0] u,z;

always @ (*)
	begin
	if (u==2 )
		case (L)
				2'b00:   BRAM2_address_out={X_5bits,Y_5bits}; 		
				2'b01:   BRAM2_address_out={X_5bits,Y_5bits+5'b01000};  
				2'b10:   BRAM2_address_out={X_5bits,Y_5bits+5'b10000};  
				2'b11:   BRAM2_address_out={X_5bits,Y_5bits+5'b11000};  
		endcase
		
		else if (u==4)
		case (L)
				2'b00:  BRAM2_address_out={X_5bits+j-5'b00001,Y_5bits}; 		
				2'b01:  BRAM2_address_out={X_5bits+j-5'b00001,Y_5bits+5'b01000};  
				2'b10:  BRAM2_address_out={X_5bits+j-5'b00001,Y_5bits+5'b10000};  
				2'b11:  BRAM2_address_out={X_5bits+j-5'b00001,Y_5bits+5'b11000};  
		endcase	
	else if (u==5)
		case(z)
			    2:  BRAM2_address_out={XREG_5bits,YREG_5bits}; 			        
				3:  BRAM2_address_out={XREG_5bits,YREG_5bits+5'b01000}; 	    
				4:  BRAM2_address_out={XREG_5bits,YREG_5bits+5'b10000}; 		
				5:  BRAM2_address_out={XREG_5bits,YREG_5bits+5'b11000};  		
			    6:  BRAM2_address_out={XREG_5bits+5'b01000,YREG_5bits}; 			        
				7:  BRAM2_address_out={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 	    
				0:  BRAM2_address_out={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 		
				1:  BRAM2_address_out={XREG_5bits+5'b01000,YREG_5bits+5'b11000};  	
		endcase
	else if (u==0||u==1)
		case({u,z})
			    6'b000_010:  BRAM2_address_out={ (XREG_5bits>>1 ) ,(YREG_5bits>>1)}; 			     
				6'b000_011:  BRAM2_address_out={ (XREG_5bits>>1),(YREG_5bits>>1)+5'b01000}; 	     
				6'b000_100:  BRAM2_address_out={(XREG_5bits>>1),  (YREG_5bits>>1)+5'b10000}; 		 
				6'b000_101:  BRAM2_address_out={(XREG_5bits>>1),  (YREG_5bits>>1)+5'b11000}; 		
			    6'b000_110:  BRAM2_address_out={ (XREG_5bits>>1 )+5'b01000 ,(YREG_5bits>>1)}; 		
				6'b000_111:  BRAM2_address_out={ (XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b01000}; 
				6'b001_000:  BRAM2_address_out={(XREG_5bits>>1)+5'b01000,  (YREG_5bits>>1)+5'b10000};
				6'b001_001:  BRAM2_address_out={(XREG_5bits>>1)+5'b01000,  (YREG_5bits>>1)+5'b11000};	
			    6'b001_010:  BRAM2_address_out={ (XREG_5bits>>1 ) ,(YREG_5bits>>1)}; 			     
				6'b001_011:  BRAM2_address_out={(XREG_5bits>>1),  (YREG_5bits>>1)+5'b01000}; 	     
				6'b000_000:  BRAM2_address_out={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10000}; 		     
				6'b000_001:  BRAM2_address_out={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11000}; 		
			default:   BRAM2_address_out=0; 
	endcase
	else 
		case(z)
			 1:  BRAM2_address_out={(XREG_5bits),(YREG_5bits)}; 			      
			 2:  BRAM2_address_out={(XREG_5bits),(YREG_5bits)+5'b01000}; 	      
			 3:  BRAM2_address_out={(XREG_5bits),(YREG_5bits)+5'b10000}; 		
			 0:  BRAM2_address_out={(XREG_5bits),(YREG_5bits)+5'b11000}; 
			 default:   BRAM2_address_out=0; 
		endcase	

	/*else
		case(z)
			 2: begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)}; 			            BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b01000}; 			         end
			 3: begin  BRAM2_addr1={(XREG_5bits>>1),(YREG_5bits>>1)+5'b10000}; 	         BRAM2_addr2={(XREG_5bits>>1),(YREG_5bits>>1)+5'b11000}; 	    	         end
			 0: begin  BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)}; 			   BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b01000}; 			end
			 1: begin  BRAM2_addr1={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b10000}; 	BRAM2_addr2={(XREG_5bits>>1)+5'b01000,(YREG_5bits>>1)+5'b11000}; 	    	end
	default:  begin BRAM2_addr1=0; BRAM2_addr2=0;	 end 
		endcase*/
	end

endmodule




