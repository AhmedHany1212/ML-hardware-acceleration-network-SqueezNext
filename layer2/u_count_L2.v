module u_count_L2(z_zero,clk,rst,u,u_zero,x_first_bit,y_first_bit);
input wire rst,clk,z_zero,x_first_bit,y_first_bit;
output reg  u;
output u_zero ;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			u<=0;
		else if (u==1'b1&&z_zero || y_first_bit==1||x_first_bit==1)
			u<=0;	
		else if (z_zero)
			u<=1'b1;
	end
	
assign u_zero=(u==1'b1&&z_zero);

endmodule 