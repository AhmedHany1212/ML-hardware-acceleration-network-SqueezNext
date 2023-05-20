module Reg_j(j_Reg,clk,rst,j);
output reg [1:0] j_Reg;
input clk,rst;
input [1:0] j;

always @ (posedge clk or negedge rst)
	begin
		if (!rst ) 
			j_Reg<=0; 
		else  
			j_Reg<=j; 
	end
endmodule
