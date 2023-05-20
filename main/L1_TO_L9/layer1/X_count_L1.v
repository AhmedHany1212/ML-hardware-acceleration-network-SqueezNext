//we need x_counter to count 30 times(from 0 to 29) with each (y=29)and(k=2)and(j=2)  then back to 0 and so on

module x_count_L1 (x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
output wire x_zero;
output reg [4:0] x;
input wire rst,clk,y_zero,temp_count,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			x<=0;
		else if (temp_count && !temp_zero);
		else if (temp_zero)	
			x<=0;
		else if (y_zero)
			x<=x+5'b1;
	end
assign x_zero=((x==5'b11101 &&y_zero)||temp_zero);	
endmodule