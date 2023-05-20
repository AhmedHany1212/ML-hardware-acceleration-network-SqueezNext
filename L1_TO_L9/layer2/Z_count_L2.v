module Z_count_L2(z,z_zero,u,L_zero,clk,rst,temp_zero);
input L_zero,rst,clk,temp_zero;
input wire  u;
output reg   z;
output wire z_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		else if((z && L_zero) || u==0||temp_zero)
			z<=0;
		else if(L_zero)
			begin z<=z+1'b1;  end
	end
assign z_zero=(z && L_zero) || u==0&& L_zero||temp_zero;

endmodule
