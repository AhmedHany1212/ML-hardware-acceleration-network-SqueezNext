//we need k_counter to count 3 times(from 0 to 2) with each (j=2) then back to 0 and so on

module k_count_L1(k,k_zero,clk,rst,j_zero,temp_zero);
output reg [1:0] k;
output wire k_zero;
input clk,rst,j_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin k<=0;  end
		else if((k[1]&&!k[0] && j_zero)||temp_zero)
			k<=0;
		else if(j_zero)
			begin k<=k+2'b1;  end
	end
assign k_zero=k[1]&&!k[0]&& j_zero||temp_zero;

endmodule