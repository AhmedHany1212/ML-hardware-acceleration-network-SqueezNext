module z_counter_Layer_6 (z,z_zero,clk,rst,L_zero,temp_zero);
output reg  [2:0] z;
output wire z_zero;
input clk,rst,L_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		//else if (temp_count && !temp_zero);
		else if((z==7 && L_zero)||temp_zero)
					z<=0;
		else if(L_zero)
			begin z<=z+3'b001;  end
	end
assign z_zero=z==7&& L_zero;

endmodule