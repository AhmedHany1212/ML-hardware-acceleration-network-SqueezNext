//we need j_counter to count 3 times(from 0 to 2) with each posedge clk then back to 0 and so on
module j_count_L1(j,j_zero,clk,rst,temp_zero);
output reg [1:0] j;
output wire j_zero;
input clk,rst,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			begin j<=0;  end
		else if ((j[1]&&!j[0])||temp_zero)
			begin j<=0;   end
		else 
			begin j<=j+2'b01;  end 
	end
assign j_zero=j[1]&&!j[0]  ;

endmodule
