module Reg_u_L9(u_Reg,clk,rst,u);
output reg [2:0] u_Reg;
input clk,rst;
input [2:0] u;

always @ (posedge clk or negedge rst)
	begin
		if (!rst ) 
			u_Reg<=0; 
		else  
			u_Reg<=u; 
	end
endmodule
