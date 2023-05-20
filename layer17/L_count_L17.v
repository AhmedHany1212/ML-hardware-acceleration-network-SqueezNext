module L_count_L17(L_zero,L,clk,rst,temp_zero,u);
input clk,rst,temp_zero;
input [2:0] u;
output reg [2:0] L;
output wire L_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			L<=0; 
		else if (temp_zero||((L==3&&(u==3))|| L==7))
			 L<=0; 			
		else 
			L<=L+3'b01;   
	end
assign L_zero=(temp_zero||((L==3&&(u==3))|| L==7)) ;

endmodule