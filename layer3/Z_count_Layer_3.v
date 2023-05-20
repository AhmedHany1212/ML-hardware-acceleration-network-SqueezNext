module z_counter_Layer_3 (z,z_zero,clk,rst,L_zero,temp_zero);
output reg  z;
output wire z_zero;
input clk,rst,L_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		//else if (temp_count && !temp_zero);
		else if((z&& L_zero)||temp_zero)
					z<=0;
		else if(L_zero)
			begin z<=1'b1;  end
	end
assign z_zero=z&& L_zero;

endmodule