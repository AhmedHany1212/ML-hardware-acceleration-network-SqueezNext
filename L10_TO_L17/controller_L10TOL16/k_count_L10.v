module k_count_L10(k,k_zero,u,clk,rst,temp_zero,L_zero);
input rst,clk,temp_zero,L_zero;
input [2:0] u;
output reg  [1:0] k;
output wire k_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin k<=0;  end
		else if((k[1] && L_zero)||temp_zero)
			k<=0;
		else if( u==2&& L_zero)
			begin k<=k+2'b01;  end
	end
assign k_zero=((k[1] && L_zero)||temp_zero);

endmodule

