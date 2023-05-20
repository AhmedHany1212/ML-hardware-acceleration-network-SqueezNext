module temp_counter_Layer_6(temp_count,temp_zero,clk,rst,x_zero,temp_zero_new,temp_5);
output wire  temp_count,temp_zero,temp_zero_new,temp_5;
input wire clk,rst,x_zero;
reg [3:0] temp;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			 temp<=5;
		else if ( temp==8)
			 temp<=0;	
		else if ((x_zero)||temp)
			 temp<= temp+4'b1;
	end
	
assign temp_count=(x_zero)||temp;
assign temp_zero=(temp==4);
assign temp_zero_new=(temp==8);
assign temp_5=(temp==5);
endmodule