module L_count_L2(L_zero,L,clk,rst,temp_zero);
input clk,rst,temp_zero;
output reg [2:0] L;
output wire L_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			L<=0; 
		else if (temp_zero||L==7)
			 L<=0; 			
		else 
			L<=L+3'b001;   
	end
assign L_zero=(temp_zero||L==7) ;

endmodule
