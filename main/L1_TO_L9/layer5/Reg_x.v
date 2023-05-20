module Reg_x(x_Reg,clk,rst,x);
output reg [4:0] x_Reg;
input clk,rst;
input [4:0] x;

always @ (posedge clk or negedge rst)
	begin
		if (!rst ) 
			x_Reg<=0; 
		else  
			x_Reg<=x; 
	end
endmodule
