module u_count_L9(clk,u,rst,temp_zero,u_1_2);
input wire rst,clk,temp_zero,u_1_2;
output reg [2:0] u;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			u<=0;
		else if (u==5&&temp_zero)
			u<=0;	
		else if ((u==0||u==1)&&!temp_zero)
			u<=u_1_2;	
		else if (temp_zero&&u==0)
			u<=2;				
		else if (temp_zero)
			u<=u+3'b1;
	end
endmodule
