module Reg_y_L4(y_Reg,clk,rst,y);
output reg [4:0] y_Reg;
input clk,rst;
input [4:0] y;

always @ (posedge clk or negedge rst)
	begin
		if (!rst ) 
			y_Reg<=0; 
		else  
			y_Reg<=y; 
	end
endmodule
