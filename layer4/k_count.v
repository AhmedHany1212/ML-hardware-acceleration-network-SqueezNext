module k_counter_L4(k,k_zero,clk,rst,L_zero,temp_zero);
output reg  [1:0]k;
output wire k_zero;
input clk,rst,L_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin k<=0;  end
		else if((k[1]&& L_zero)||temp_zero)
					k<=0;
		else if(L_zero)
			begin k<=k+1'b1;  end
	end
assign k_zero=((k[1]&& L_zero)||temp_zero);

endmodule