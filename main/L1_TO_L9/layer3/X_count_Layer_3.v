module x_counter_Layer_3 (x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
output wire x_zero;
output reg [4:0] x;
input wire rst,clk,y_zero,temp_count,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			x<=0;
		else if (temp_count && !temp_zero);
		else if ((x==5'b11101 &&y_zero)||temp_zero)	
			x<=0;
		else if (y_zero)
			x<=x+5'b1;
	end
assign x_zero=((x==5'b11101 &&y_zero)||temp_zero);	
endmodule