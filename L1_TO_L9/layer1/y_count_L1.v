//we need y_counter to count 30 times(from 0 to 29) with each (k=2)and(j=2) then back to 0 and so on

module y_count_L1 (y,y_zero,clk,rst,k_zero,temp_count,temp_zero);
output wire y_zero;
output reg [4:0] y;
input wire rst,clk,k_zero,temp_count,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_count && !temp_zero);
		else if ((y==5'b11101 &&k_zero)||temp_zero)	
			y<=0;
		else if (k_zero)
			y<=y+5'b1;
	end
assign y_zero=((y==5'b11101 &&k_zero)||temp_zero);	
endmodule