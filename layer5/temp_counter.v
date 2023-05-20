module temp_counter(temp_count,temp_zero,clk,rst,x_zero,temp_zero_new);
output wire  temp_count,temp_zero,temp_zero_new;
input wire clk,rst,x_zero;
reg [3:0] temp;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			 temp<=6;
		else if ( temp==10)
			 temp<=0;	
		else if ((x_zero)||(temp))
			 temp<= temp+4'b1;
	end
assign temp_count=((x_zero)||(temp));
assign temp_zero=( temp==5);
assign temp_zero_new=(temp==10);
endmodule

