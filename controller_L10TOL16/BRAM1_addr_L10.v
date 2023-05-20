module BRAM1_addr_L10(BRAM1_addr1,BRAM1_addr2,L,x_Reg5,y_Reg5,x,y,u,k,z);
output reg[9:0] BRAM1_addr1,BRAM1_addr2;
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
				0: begin  BRAM1_addr1={X_5bits,Y_5bits}; 			             BRAM1_addr2={X_5bits,Y_5bits+5'b01000}; 				        end
				1: begin  BRAM1_addr1={X_5bits,Y_5bits+5'b10000}; 	          BRAM1_addr2={X_5bits,Y_5bits+5'b11000}; 				        end
				
				2: begin  BRAM1_addr1={X_5bits+5'b01000,Y_5bits}; 			    BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b01000}; 		    end
				3: begin  BRAM1_addr1={X_5bits+5'b01000,Y_5bits+5'b10000}; 	 BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b11000}; 		    end
				
			   4: begin  BRAM1_addr1={X_5bits+5'b10000,Y_5bits}; 	          BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b01000};             end
				5: begin  BRAM1_addr1={X_5bits+5'b10000,Y_5bits+5'b10000}; 	 BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b11000};		        end
				
				6: begin  BRAM1_addr1={X_5bits+5'b11000,Y_5bits}; 			    BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b01000}; 		    end
				7: begin  BRAM1_addr1={X_5bits+5'b11000,Y_5bits+5'b10000}; 	 BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b11000}; 		    end
				
		endcase
	
	else if (u==2)
		case (L)
				0: begin  BRAM1_addr1={X_5bits,Y_5bits+k-5'b00001}; 			             BRAM1_addr2={X_5bits,Y_5bits+5'b01000+k-5'b00001}; 				        end
				1: begin  BRAM1_addr1={X_5bits,Y_5bits+5'b10000+k-5'b00001}; 	          BRAM1_addr2={X_5bits,Y_5bits+5'b11000+k-5'b00001}; 				        end
				
				2: begin  BRAM1_addr1={X_5bits+5'b01000,Y_5bits+k-5'b00001}; 			    BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b01000+k-5'b00001}; 		    end
				3: begin  BRAM1_addr1={X_5bits+5'b01000,Y_5bits+5'b10000+k-5'b00001}; 	 BRAM1_addr2={X_5bits+5'b01000,Y_5bits+5'b11000+k-5'b00001}; 		    end
				
			   4: begin  BRAM1_addr1={X_5bits+5'b10000,Y_5bits+k-5'b00001}; 	          BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b01000+k-5'b00001};             end
				5: begin  BRAM1_addr1={X_5bits+5'b10000,Y_5bits+5'b10000+k-5'b00001}; 	 BRAM1_addr2={X_5bits+5'b10000,Y_5bits+5'b11000+k-5'b00001};		        end
				
				6: begin  BRAM1_addr1={X_5bits+5'b11000,Y_5bits+k-5'b00001}; 			    BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b01000+k-5'b00001}; 		    end
				7: begin  BRAM1_addr1={X_5bits+5'b11000,Y_5bits+5'b10000+k-5'b00001}; 	 BRAM1_addr2={X_5bits+5'b11000,Y_5bits+5'b11000+k-5'b00001}; 		    end
				
		endcase
	
	else if (u==1)
		case(z)
			    0: begin  BRAM1_addr1={XREG_5bits,YREG_5bits}; 			         BRAM1_addr2={XREG_5bits,YREG_5bits+5'b01000}; 				        end
				1: begin  BRAM1_addr1={XREG_5bits,YREG_5bits+5'b10000};          BRAM1_addr2={XREG_5bits,YREG_5bits+5'b11000}; 				        end
				
				//3: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits}; 		       BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 		end
				//0: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 	   BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 	    end	
				default begin BRAM1_addr1=0; BRAM1_addr2=0;	 end 
		endcase
		
	else
		case(z)
			 1: begin  BRAM1_addr1={XREG_5bits,YREG_5bits}; 			    BRAM1_addr2={XREG_5bits,YREG_5bits+5'b01000}; 			   end
			 2: begin  BRAM1_addr1={XREG_5bits,YREG_5bits+5'b10000}; 	    BRAM1_addr2={XREG_5bits,YREG_5bits+5'b11000}; 	    	   end
			 
			 3: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits}; 		       BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 		end
			 0: begin  BRAM1_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 	   BRAM1_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 	    end
			 default begin BRAM1_addr1=0; BRAM1_addr2=0;	 end 
		endcase


	end




endmodule
