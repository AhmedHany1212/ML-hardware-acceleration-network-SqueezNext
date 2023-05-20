//we need temp_counter  to count 4 times(from 1 to 4) with each (x=29)and(y=29)and(k=2)and(j=2) then back to 0 and so on

module temp_count_L1 (temp_count,temp_zero,clk,rst,x_zero,temp_zero_new);
output wire  temp_count,temp_zero,temp_zero_new;
input wire clk,rst,x_zero;
reg [3:0] temp;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			 temp<=5;
		else if (temp==8)
			 temp<=0;	
		else if ((x_zero)||temp)
			 temp<= temp+4'b1;
	end
assign temp_count=(x_zero)||temp;
assign temp_zero=(temp==4);
assign temp_zero_new=(temp==8);
//assign temp_5=(temp==5);

endmodule
