module y_count_L10(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero);
input wire z_zero,rst,clk,temp_counter,temp_zero;
output wire y_zero;
output reg [2:0] y;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_counter&&!temp_zero);			
		else if (y_zero)	
			y<=0;
		else if (z_zero)
			y<=y+3'b001;
	end
assign y_zero=((z_zero&&(y==7))||temp_zero);	
endmodule
