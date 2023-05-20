module BRAM2_out_Layer_3(BRAM2_addr,clk,rst,L_zero,x,y);
output reg [9:0] BRAM2_addr;
input clk,rst,L_zero;
input [4:0] x,y;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			BRAM2_addr<=0;
		else if(L_zero)
			BRAM2_addr<={x,y};
	end

endmodule
