module R_count_L2(clk,rst,R_zero,L_zero,temp_zero);
input  L_zero;
input clk,rst,temp_zero;
//input [2:0] temp;
 reg [2:0] R;
 output wire R_zero;


always @ (posedge clk or negedge rst)
	begin
		if (! rst ) begin
			R<=0;  end
		else if (temp_zero)begin
			R<=1; end
		else if (R==5)begin
			R<=0; ;end
		else if (R||L_zero )
			R<=R+3'b01;
	end
assign R_zero=R==5;
endmodule
