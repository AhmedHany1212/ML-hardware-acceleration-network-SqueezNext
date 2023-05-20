
module R_count_L17(u,L_zero,j_zero,k_zero,clk,rst,R_zero);
input L_zero,rst,clk,j_zero,k_zero;
input wire [2:0] u;
 reg  [2:0] R;
output wire R_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin 
				R<=0; 
			end
		else if((R==5))//zero
			begin
				R<=0;
			end	
		else if(k_zero||(j_zero)||(L_zero&&u!=3&&u!=4)||R)
			begin 	
				R<=R+3'b1; 	
			end	
	end
	assign R_zero=(R==5);
endmodule