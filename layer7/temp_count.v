module temp_count_L7(x_zero,clk,rst,temp_counter,temp_zero,temp_zero_new,temp_6);
input wire x_zero,rst,clk;
reg [3:0] temp;
output wire temp_counter,temp_zero,temp_zero_new,temp_6;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			 temp<=6;
		else if (temp==10)
			 temp<=0;	
		else if ((x_zero)||temp)
			 temp<= temp+4'b1;
	end
assign temp_counter=x_zero||temp;
assign temp_zero=(temp==5);
assign temp_zero_new=(temp==10);
assign temp_6=(temp==6);

endmodule
