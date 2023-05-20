
module BRAM1_address_L10(BRAM1_addr,L,x_Reg5,y_Reg5,x,y,u,k,z);
output reg[9:0] BRAM1_addr;
input [2:0] x_Reg5,y_Reg5,x,y;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={2'b00,x};
assign Y_5bits={2'b00,y};
assign XREG_5bits={2'b0,x_Reg5};
assign YREG_5bits={2'b0,y_Reg5};
input [2:0] L;
input [1:0] k;
input [2:0] u,z;



always @ (*)
	begin
	if (u==0 ||u==4)
		case (L)
				
				0:  BRAM1_addr={X_5bits,Y_5bits}; 			       
				1:  BRAM1_addr={X_5bits,Y_5bits+5'b01000} ;	       
				
				2:  BRAM1_addr={X_5bits,Y_5bits+5'b10000};  		
				3:  BRAM1_addr={X_5bits,Y_5bits+5'b11000};  		
				
				4:  BRAM1_addr={X_5bits+5'b01000,Y_5bits}; 		 
				5:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+5'b01000}  ;
				               
				6:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+5'b10000}; 
				7:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+5'b11000}; 
				default begin BRAM1_addr=0; end 

		endcase
	
	else if (u==2)
		case (L)				
				0:  BRAM1_addr={X_5bits,Y_5bits+k-5'b00001}; 			       
                1:  BRAM1_addr={X_5bits,Y_5bits+k-5'b00001+5'b01000} ;	       

                2:  BRAM1_addr={X_5bits,Y_5bits+k-5'b00001+5'b10000};  		
                3:  BRAM1_addr={X_5bits,Y_5bits+k-5'b00001+5'b11000};  		
                
                4:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+k-5'b00001}; 		 
                5:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+k-5'b00001+5'b01000}  ;
														
                6:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+k-5'b00001+5'b10000}; 
                7:  BRAM1_addr={X_5bits+5'b01000,Y_5bits+k-5'b00001+5'b11000}; 
				default begin BRAM1_addr=0; end 


		endcase
	
	else if (u==1)
		case(z)
			    0:   BRAM1_addr={XREG_5bits,YREG_5bits}; 			       
				1:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b01000};        

				//3: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits}; 		       BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 		end
				//0: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 	   BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 	    end	
				default begin BRAM1_addr=0; end 
		endcase
		
	else
		case(z)
			 1:   BRAM1_addr={XREG_5bits,YREG_5bits}; 		
			 2:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b01000}; 
			 
			 3:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b10000}; 
			 0:   BRAM1_addr={XREG_5bits,YREG_5bits+5'b11000}; 

			default begin BRAM1_addr=0;	 end 
		endcase


	end




endmodule
