module x_count_L10(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero);
input wire y_zero,rst,clk,temp_counter,temp_zero;
output reg [2:0] x;
output wire x_zero;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			x<=0;
		else if (temp_counter&&!temp_zero);
		else if ((((x==7)&&y_zero)||temp_zero))
			x<=0;	
		else if (y_zero)
			x<=x+3'b001;
	end
assign x_zero=(((x==7)&&y_zero)||temp_zero);
endmodule
