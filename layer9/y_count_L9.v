

module y_count_L9(z_zero,clk,y,y_zero,rst,temp_counter,temp_zero,u);
input wire z_zero,rst,clk,temp_counter,temp_zero;
input wire [2:0] u;

output wire y_zero;
output reg [3:0] y;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_counter&&!temp_zero);			
		else if (y_zero)	
			y<=0;
		else if (z_zero&&(u==1))
			y<=y+4'b010;
		else if (z_zero&&u!=0)
			y<=y+4'b001;
	end
assign y_zero=((z_zero&&(y==7)&&!(u==1&&u==0))||temp_zero||(y==14&&z_zero&&u!=0));	
endmodule
