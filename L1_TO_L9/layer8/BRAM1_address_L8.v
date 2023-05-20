module BRAM1_address_L8(BRAM1_addr,x_Reg5,y_Reg5,x,y,z,u,L,k);
output reg [9:0] BRAM1_addr;
input [1:0] z;
input [2:0] u;
input [4:0] x_Reg5,y_Reg5,x,y;
input [1:0]L,k;

always @ (*)
begin
	case (z)
			2'b11: BRAM1_addr={x_Reg5,y_Reg5}; 
			2'b00: BRAM1_addr={x_Reg5,y_Reg5+5'b10000}; 
			2'b01: BRAM1_addr={x_Reg5+5'b10000,y_Reg5}; 
			2'b10: BRAM1_addr={x_Reg5+5'b10000,y_Reg5+5'b10000}; 
	endcase	
	if(u==1)
		BRAM1_addr={x_Reg5,y_Reg5}; 			
	case (u==0)
		1: case(L)
				2'b00: BRAM1_addr={x,y}; 
				2'b01: BRAM1_addr={x,y+5'b10000};
                2'b10: BRAM1_addr={x+5'b10000,y};
                2'b11: BRAM1_addr={x+5'b10000,y+5'b10000};

			endcase
	endcase
    case (u==4)
            1: case(L)
                    2'b00: BRAM1_addr={x,y}; 
                    2'b01: BRAM1_addr={x,y+5'b10000}; 
                endcase
        endcase
    if (u==2)        
        BRAM1_addr={x,y+k-5'b00001};                   
	case (u==3)
		1: case(z)
				2'b01: BRAM1_addr={x_Reg5,y_Reg5}; 
				2'b00: BRAM1_addr={x_Reg5,y_Reg5+5'b10000}; 
			endcase
	endcase		
end
endmodule

