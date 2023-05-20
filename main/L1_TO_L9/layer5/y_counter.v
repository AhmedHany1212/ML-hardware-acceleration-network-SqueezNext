module y_counter(y,y_zero,clk,rst,z_zero,temp_count,temp_zero);
output wire y_zero;
output reg [4:0] y;
input wire rst,clk,z_zero,temp_count,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_count && !temp_zero);
		else if ((y==5'b11101 &&z_zero)||temp_zero)	
			y<=0;
		else if (z_zero)
			y<=y+5'b1;
	end
assign y_zero=((y==5'b11101 &&z_zero)||temp_zero);	
endmodule