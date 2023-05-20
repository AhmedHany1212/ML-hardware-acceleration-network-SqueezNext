module Reg_xy_1_L17(x_Reg1,y_Reg1,clk,rst,x,y);
output reg [2:0] x_Reg1,y_Reg1;
input clk,rst;
input [2:0] x,y;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )begin 
			x_Reg1<=0; y_Reg1<=0;end
		else  begin
			x_Reg1<=x; y_Reg1<=y;end
	end

endmodule
