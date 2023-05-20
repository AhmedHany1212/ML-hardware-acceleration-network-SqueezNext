module x_count_L9(x,x_zero,y_zero,clk,rst,temp_counter,temp_zero,u);
input wire y_zero,rst,clk,temp_counter,temp_zero;
input wire [2:0] u;
output reg [3:0] x;
output wire x_zero;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			x<=0;
		else if (temp_counter&&!temp_zero);
		else if (((x==7)&&y_zero&&!(u==0||u==1))||temp_zero)
			x<=0;	
		else if (y_zero&&(u==1))
			x<=x+4'b0010;
		else if (y_zero&&u!=1)
			x<=x+4'b0001;
	end
assign x_zero=(((x==7)&&y_zero&&!(u==0&&u==1))||temp_zero||(x==14&&y_zero));
endmodule
