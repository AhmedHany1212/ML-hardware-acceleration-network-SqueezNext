module R_counter(R,R_zero,clk,rst,j_zero,temp_zero);
output reg [2:0] R;
output wire R_zero;
input clk,rst,j_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) begin
			R<=0; end
		else if (temp_zero)begin
			R<=3'b1; end
		else if(R==5)
			R<=0;
		else if ((R[0]||R[1]||R[2])||j_zero)
			R<=R+3'b1;
	end
assign R_zero=(R==5);

endmodule
