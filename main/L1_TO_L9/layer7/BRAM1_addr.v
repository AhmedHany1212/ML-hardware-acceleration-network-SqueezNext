module BRAM1_addr_L7(BRAM1_addr1,BRAM1_addr2,L_zero,x_Reg5,y_Reg5,x,y,u,k,z);
output reg[9:0] BRAM1_addr1,BRAM1_addr2;
input [4:0] x_Reg5,y_Reg5,x,y;
input L_zero;
input [1:0] k,z;
input [2:0] u;
wire [3:0] flags;
assign flags ={u==4&&z!=1,u==3,u==2||(u==4&&z==1),L_zero};
always @(*)
begin
case(flags)
4'b0000:	 begin BRAM1_addr1={x,y};  			 		  BRAM1_addr2={x,y+5'b10000}; 			 			  end 
4'b0001:	 begin BRAM1_addr1={x+5'b10000,y};  		  BRAM1_addr2={x+5'b10000,y+5'b10000};  			  end
(4'b0010):begin BRAM1_addr1={x_Reg5,y_Reg5}; 		  BRAM1_addr2={x_Reg5,y_Reg5+5'b10000}; 			  end 
(4'b0011):begin BRAM1_addr1={x_Reg5,y_Reg5}; 		  BRAM1_addr2={x_Reg5,y_Reg5+5'b10000}; 			  end 
(4'b0100):begin BRAM1_addr1={x,y+k-5'b00001};	     BRAM1_addr2={x,y+k+5'b10000-5'b00001}; 			  end
(4'b0101):begin BRAM1_addr1={x,y+k-5'b00001};		  BRAM1_addr2={x,y+k+5'b10000-5'b00001}; 			  end
(4'b1001):begin BRAM1_addr1={x_Reg5+5'b10000,y_Reg5};BRAM1_addr2={x_Reg5+5'b10000,y_Reg5+5'b10000}; end 
(4'b1000):begin BRAM1_addr1={x_Reg5+5'b10000,y_Reg5};BRAM1_addr2={x_Reg5+5'b10000,y_Reg5+5'b10000}; end 
default : begin BRAM1_addr1=0; BRAM1_addr2=0;  end
endcase
end
/*
always @ (*)
	begin
	case (L_zero)
			0: begin  BRAM1_addr1={x,y}; 			 BRAM1_addr2={x,y+5'b10000}; 				end 
			1:  begin BRAM1_addr1={x+5'b10000,y};  BRAM1_addr2={x+5'b10000,y+5'b10000}; end
	endcase	
	case (u==2)
			1: begin  BRAM1_addr1={x_Reg5,y_Reg5}; 			 BRAM1_addr2={x_Reg5,y_Reg5+5'b10000}; 				end 
	endcase	
	case (u==3)
			1: begin  BRAM1_addr1={x,y+k}; 			 BRAM1_addr2={x,y+k+5'b10000}; 				end 
	endcase	
	case (u==4)
	1:begin
		case(z[0]&&!z[1])
			1: begin  BRAM1_addr1={x_Reg5,y_Reg5}; 			 BRAM1_addr2={x_Reg5,y_Reg5+5'b10000}; 				end 
			0: begin  BRAM1_addr1={x_Reg5+5'b10000,y_Reg5};  BRAM1_addr2={x_Reg5+5'b10000,y_Reg5+5'b10000}; 				end 
		endcase	
		end
	endcase
end
*/
endmodule
