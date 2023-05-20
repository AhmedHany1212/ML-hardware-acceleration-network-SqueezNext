module BRAM2_addr_L10(BRAM2_addr1,BRAM2_addr2,L,x_Reg5,y_Reg5,x,y,u,j,z);
output reg[9:0] BRAM2_addr1,BRAM2_addr2;
input [2:0] x_Reg5,y_Reg5,x,y;
wire [4:0] X_5bits,Y_5bits,XREG_5bits,YREG_5bits;
assign X_5bits={2'b00,x};
assign Y_5bits={2'b00,y};
assign XREG_5bits={2'b0,x_Reg5};
assign YREG_5bits={2'b0,y_Reg5};
input [2:0] L;
input [1:0] j;
input [2:0] u,z;



always @ (*)
	begin
	if (u==1)
		case (L)
				0: begin  BRAM2_addr1={X_5bits,Y_5bits}; 			             BRAM2_addr2={X_5bits,Y_5bits+5'b01000}; 				        end
				1: begin  BRAM2_addr1={X_5bits,Y_5bits+5'b10000}; 	          BRAM2_addr2={X_5bits,Y_5bits+5'b11000}; 				        end
				
				2: begin  BRAM2_addr1={X_5bits+5'b01000,Y_5bits}; 			    BRAM2_addr2={X_5bits+5'b01000,Y_5bits+5'b01000}; 		    end
				3: begin  BRAM2_addr1={X_5bits+5'b01000,Y_5bits+5'b10000}; 	 BRAM2_addr2={X_5bits+5'b01000,Y_5bits+5'b11000}; 		    end
				
		  default: begin  BRAM2_addr1=0;                                         BRAM2_addr2=0;                                                 end 
		endcase
	else if (u==3)
		case (L)
				0: begin  BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits}; 			            BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b01000}; 				        end
				1: begin  BRAM2_addr1={X_5bits+j-5'b00001,Y_5bits+5'b10000}; 	         BRAM2_addr2={X_5bits+j-5'b00001,Y_5bits+5'b11000}; 				        end
				
				2: begin  BRAM2_addr1={X_5bits+5'b01000+j-5'b00001,Y_5bits}; 			    BRAM2_addr2={X_5bits+5'b01000+j-5'b00001,Y_5bits+5'b01000}; 		    end
				3: begin  BRAM2_addr1={X_5bits+5'b01000+j-5'b00001,Y_5bits+5'b10000}; 	 BRAM2_addr2={X_5bits+5'b01000+j-5'b00001,Y_5bits+5'b11000}; 		    end
				
		  default: begin  BRAM2_addr1=0;                                               BRAM2_addr2=0;                                                 end 
		endcase	
	else if (u==0||u==2)
		case(z)
			    1: begin  BRAM2_addr1={XREG_5bits,YREG_5bits}; 			                 BRAM2_addr2={XREG_5bits,YREG_5bits+5'b01000}; 				        end
				2: begin  BRAM2_addr1={XREG_5bits,YREG_5bits+5'b10000}; 	             BRAM2_addr2={XREG_5bits,YREG_5bits+5'b11000}; 				        end
				
				3: begin  BRAM2_addr1={XREG_5bits+5'b01000,YREG_5bits}; 			     BRAM2_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 		    end
				0: begin  BRAM2_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 	     BRAM2_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 			end	
		  default: begin  BRAM2_addr1=0;                                                 BRAM2_addr2=0;                                                     end 
		endcase		
	else
		case(z)
			 2: begin  BRAM2_addr1={XREG_5bits,YREG_5bits}; 			            BRAM2_addr2={XREG_5bits,YREG_5bits+5'b01000}; 			           end
			 3: begin  BRAM2_addr1={XREG_5bits,YREG_5bits+5'b10000}; 	            BRAM2_addr2={XREG_5bits,YREG_5bits+5'b11000}; 	    	           end
			 
			 4: begin  BRAM2_addr1={XREG_5bits+5'b01000,YREG_5bits}; 			    BRAM2_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b01000}; 			   end
			 5: begin  BRAM2_addr1={XREG_5bits+5'b01000,YREG_5bits+5'b10000}; 	    BRAM2_addr2={XREG_5bits+5'b01000,YREG_5bits+5'b11000}; 	    	   end
			 
			 6: begin  BRAM2_addr1={XREG_5bits+5'b10000,YREG_5bits}; 			    BRAM2_addr2={XREG_5bits+5'b10000,YREG_5bits+5'b01000}; 			   end
			 7: begin  BRAM2_addr1={XREG_5bits+5'b10000,YREG_5bits+5'b10000}; 	    BRAM2_addr2={XREG_5bits+5'b10000,YREG_5bits+5'b11000}; 	    	   end
			 
			 0: begin  BRAM2_addr1={XREG_5bits+5'b11000,YREG_5bits}; 			    BRAM2_addr2={XREG_5bits+5'b11000,YREG_5bits+5'b01000}; 			   end
			 1: begin  BRAM2_addr1={XREG_5bits+5'b11000,YREG_5bits+5'b10000}; 	    BRAM2_addr2={XREG_5bits+5'b11000,YREG_5bits+5'b11000}; 	    	   end
	   default: begin  BRAM2_addr1=0;                                               BRAM2_addr2=0;                                                     end 
 
		
		endcase


	end

endmodule
