module z_counter(z,z_zero,clk,rst,j_zero,temp_zero);
output reg  z;
output wire z_zero;
input clk,rst,j_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		else if((z&& j_zero)||temp_zero)
					z<=0;
		else if(j_zero)
			begin z<=1'b1;  end
	end
assign z_zero=(z&& j_zero)||temp_zero;

endmodule