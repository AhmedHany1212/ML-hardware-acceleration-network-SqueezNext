module R_counter_L4(R_zero,clk,rst,K_zero,temp_zero);
reg [2:0] R;
output wire R_zero;
input clk,rst,K_zero,temp_zero;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) begin
			R<=0; end
		else if (temp_zero)begin
			R<=3'b1; end
		else if(R[2])
			R<=0;
		else if ((R[0]||R[1])||K_zero)
			R<=R+3'b1;
	end
assign R_zero=R[2];

endmodule
