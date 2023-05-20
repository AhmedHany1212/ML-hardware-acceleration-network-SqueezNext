module k_count_L8(k,k_zero,u,clk,rst,temp_zero);
input rst,clk,temp_zero;
input [2:0] u;
output reg  [1:0] k;
output wire k_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin k<=0;  end
		else if(k[1]||temp_zero)
			k<=0;
		else if( u==2)
			begin k<=k+2'b01;  end
	end
assign k_zero=k[1]||temp_zero;

endmodule
