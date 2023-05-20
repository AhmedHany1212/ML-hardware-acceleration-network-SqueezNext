module R_count_L7(u,L_zero,j_zero,k_zero,clk,rst,R_zero);
input L_zero,rst,clk,j_zero,k_zero;
input wire [2:0] u;
 reg  [2:0] R;
output wire R_zero;
//reg start;
reg [2:0] flags;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin 
				R<=0; 
				flags<=0;
			end
		else if((R==5)||(((R==1&&u!=4&&u!=3)||(R==2&&u==3))&&(flags!=u||u==1)))//zero
			begin
				R<=0;
				if (R==5)
					begin
						if (u==5)
							flags<=0;
						else if (u==0)	
							flags<=u+3'b010;
						else 
							flags<=u+3'b1;
					end
			end	
		else if(k_zero||(L_zero&&j_zero)||(L_zero&&u!=3&&u!=4)||R)
			begin 	
				R<=R+3'b1; 	
			end	
	end
	assign R_zero=(R==5)||(((R==1&&u!=4&&u!=3)||(R==2&&u==3))&&(flags!=u));
endmodule