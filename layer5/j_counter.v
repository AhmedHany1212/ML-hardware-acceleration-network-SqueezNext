module j_counter(j,j_zero,clk,rst,L_zero,temp_zero);
output reg  [1:0]j;
output wire j_zero;
input clk,rst,L_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin j<=0;  end
		else if((j[1]&& L_zero)||temp_zero)
					j<=0;
		else if(L_zero)
			begin j<=j+1'b1;  end
	end
assign j_zero=((j[1]&& L_zero)||temp_zero);

endmodule