module y_count_L17(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero,u);
input wire z_zero,rst,clk,temp_counter,temp_zero;
input wire [2:0] u;
output wire y_zero;
output reg [2:0] y;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_counter&&!temp_zero);			
		else if (y_zero)	
			y<=0;
		else if (z_zero&&(u==1))
			y<=y+3'b010;
		else if (z_zero&&!(u==0))
			y<=y+3'b001;
	end
assign y_zero=((z_zero&&(y==3)&&!(u==1&&u==0))||temp_zero||(y==6&&z_zero&&u==1));	

endmodule
