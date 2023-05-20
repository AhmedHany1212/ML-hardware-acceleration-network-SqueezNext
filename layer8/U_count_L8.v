module u_count_L8(clk,u,rst,temp_zero);
input wire rst,clk,temp_zero;
output reg [2:0] u;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			u<=0;
		else if (u==4&&temp_zero)
			u<=0;	
		else if (temp_zero)
			u<=u+3'b1;
	end
endmodule
