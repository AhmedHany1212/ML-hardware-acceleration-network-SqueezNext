module y_count_L2(u_zero,clk,y,y_zero,rst,temp_counter,temp_zero,L_zero,x_first_bit);
input wire u_zero,rst,clk,temp_counter,temp_zero,L_zero,x_first_bit;
output wire y_zero;
output reg [4:0] y;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_counter&&!temp_zero);			
		else if ((y==29 && L_zero)||	temp_zero)
			y<=0;
		else if (u_zero||(L_zero&&y[0]==1)||(L_zero&&x_first_bit))
			y<=y+5'b1;
	end
assign y_zero=((y==29 && L_zero)||	temp_zero);	
endmodule
