module L_counter_Layer_3 (L,L_zero,clk,rst,temp_zero);
output reg [1:0] L;
output wire L_zero;
input clk,rst,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) 
			begin L<=0;  end
		//else if (temp_count && !temp_zero);
		else if ((L[1]&&L[0])||temp_zero)
			begin L<=0;   end
		else 
			begin L<=L+2'b01;  end 
	end
assign L_zero=L[1]&&L[0]  ;

endmodule
