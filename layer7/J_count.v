module J_count_L7(u,L_zero,clk,rst,j,j_zero,temp_zero);
input L_zero,rst,clk,temp_zero;
input [2:0] u;
output reg  [1:0] j;
output wire j_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			 j<=0;  
	//	else if (temp_counter&&!temp_zero);	
		else if((j==2 && L_zero)||temp_zero)
			j<=0;
		else if(L_zero && u==4)
			 j<=j+2'b01;  
	end
assign j_zero=(j==2 && L_zero)||temp_zero;

endmodule
