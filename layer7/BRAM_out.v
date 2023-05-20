module BRAM2_address_L7(BRAM2_addr,x_Reg5,y_Reg5,x,y,z,u,L,j);
output reg [9:0] BRAM2_addr;
input [1:0] z,j;
input [2:0] u;
input [4:0] x_Reg5,y_Reg5,x,y;
input L;

always @ (*)
	begin
		if(u==5)
			case (z)
					2'b11: BRAM2_addr={x_Reg5,y_Reg5}; 
					2'b00: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
					2'b01: BRAM2_addr={x_Reg5+5'b10000,y_Reg5}; 
					2'b10: BRAM2_addr={x_Reg5+5'b10000,y_Reg5+5'b10000}; 
			endcase	
		else if (u==2)
			case(L)
					1'b0: BRAM2_addr={x,y}; 
					1'b1: BRAM2_addr={x,y+5'b10000}; 
			endcase
		else if (u==4)
			case(L)
					1'b0: BRAM2_addr={x+j-5'b00001,y}; 
					1'b1: BRAM2_addr={x+j-5'b00001,y+5'b10000}; 
			endcase
		else if (u==3)
			case(z)
					2'b00: BRAM2_addr={x_Reg5,y_Reg5}; 
					2'b01: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
					default: BRAM2_addr=0;
			endcase		
		else
			case({u,z}) //5bit
					5'b000_11: BRAM2_addr={x_Reg5,y_Reg5}; 
					5'b001_00: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
					5'b001_01: BRAM2_addr={x_Reg5+5'b10000,y_Reg5}; 
					5'b000_00: BRAM2_addr={x_Reg5+5'b10000,y_Reg5+5'b10000}; 
					5'b000_01: BRAM2_addr={x_Reg5,y_Reg5}; 
					5'b000_10: BRAM2_addr={x_Reg5,y_Reg5+5'b10000};
					default:	 BRAM2_addr=0;
			endcase	
	end
endmodule

