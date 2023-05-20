module L_counter_L4(L,L_zero,clk,rst,temp_zero);
output reg  L;
output wire L_zero;
input clk,rst,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			begin L<=0;  end
		else if ((L)||temp_zero)
			begin L<=0;   end
		else 
			begin L<=L+1'b1;  end 
	end
assign L_zero=L  ;

endmodule
