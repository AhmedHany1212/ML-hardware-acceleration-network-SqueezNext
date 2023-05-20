module L_count_L7(L_zero,L,clk,rst,temp_zero);
input clk,rst,temp_zero;
output reg L;
output wire L_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			L<=0; 
		//else if (temp_counter&&!temp_zero);
		else if (temp_zero||L)
			 L<=0; 			
		else 
			L<=!L;   
	end
assign L_zero=(temp_zero||L) ;

endmodule
