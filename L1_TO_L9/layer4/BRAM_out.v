module BRAM2_out_L4(BRAM2_addr,clk,rst,k_zero,x,y);
output reg [9:0] BRAM2_addr;
input clk,rst,k_zero;
input [4:0] x,y;
//input [2:0] R;

always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			BRAM2_addr<=0;
		else if(k_zero)
			BRAM2_addr<={x,y};
	end

endmodule
