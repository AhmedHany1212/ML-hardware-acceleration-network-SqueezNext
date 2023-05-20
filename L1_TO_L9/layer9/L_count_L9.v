module L_count_L9(L_zero,L,clk,rst,temp_zero,u);
input clk,rst,temp_zero;
input [2:0] u;
output reg [1:0] L;
output wire L_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			L<=0; 
		else if (temp_zero||((L==1&&(u==3))|| L==3))
			 L<=0; 			
		else 
			L<=L+2'b01;   
	end
assign L_zero=(temp_zero||((L==1&&(u==3))|| L==3)) ;

endmodule
