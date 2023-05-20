module BRAM2_address_L8(BRAM2_addr,x_Reg5,y_Reg5,x,y,z,u,L,j);
output reg [9:0] BRAM2_addr;
input [1:0] z;
input [2:0] u;
input [4:0] x_Reg5,y_Reg5,x,y;
input [1:0]L,j;

always @ (*)
begin
	case (z)
			2'b11: BRAM2_addr={x_Reg5,y_Reg5}; 
			2'b00: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
			2'b01: BRAM2_addr={x_Reg5+5'b10000,y_Reg5}; 
			2'b10: BRAM2_addr={x_Reg5+5'b10000,y_Reg5+5'b10000}; 
	endcase	
	case (u==0)
		1: case(z)
				2'b00: BRAM2_addr={x_Reg5,y_Reg5}; 
				2'b01: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
			endcase
	endcase	
	case (u==1)
		1: case(L)
				2'b00: BRAM2_addr={x,y}; 
				2'b01: BRAM2_addr={x,y+5'b10000}; 
			endcase
	endcase
    case (u==3)
		1: case(L)
				2'b00: BRAM2_addr={x+j-5'b00001,y}; 
				2'b01: BRAM2_addr={x+j-5'b00001,y+5'b10000}; 
			endcase
	endcase

	case (u==2)
		1: case(z)
				2'b00: BRAM2_addr={x_Reg5,y_Reg5}; 
				2'b01: BRAM2_addr={x_Reg5,y_Reg5+5'b10000}; 
			endcase
	endcase		
end
endmodule

