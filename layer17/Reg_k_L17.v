module Reg_k_L17(k_Reg,clk,rst,k);
output reg [1:0] k_Reg;
input clk,rst;
input [1:0] k;

always @ (posedge clk or negedge rst)
	begin
		if (!rst ) 
			k_Reg<=0; 
		else  
			k_Reg<=k; 
	end
endmodule
