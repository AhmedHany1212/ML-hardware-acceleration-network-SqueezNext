module y_count_L8(u,z_zero,L_zero,clk,y,y_zero,rst,temp_counter,temp_zero);
input wire z_zero,L_zero,rst,clk,temp_counter,temp_zero;
input wire [2:0] u;
output wire y_zero;
output reg [4:0] y;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			y<=0;
		else if (temp_counter&&!temp_zero);			
		else if (y_zero)	
			y<=0;
		else if ((z_zero&&L_zero)||(L_zero&&u==1))
			y<=y+5'b1;
	end
assign y_zero=(L_zero&&((y==14))&&(z_zero||u==1))||temp_zero;	
endmodule
