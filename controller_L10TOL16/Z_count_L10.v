module Z_count_L10(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero);
input L_zero,rst,clk,j_zero,k_zero,temp_zero;
input wire [2:0] u;
output reg  [2:0] z;
output wire z_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		else if((L_zero&&(z==7||(z==1&&u==1)||(z==3&&(u==0||(u==2&&k_zero)||(u==3&&j_zero)))))||temp_zero)
			z<=0;
		else if(L_zero&&((j_zero&&u==3)||(k_zero&&u==2)||(u!=3&&u!=2)))
			begin z<=z+3'b001;  end
	end
assign z_zero=((L_zero&&(z==7||(z==1&&u==1)||(z==3&&(u==0||(u==2&&k_zero)||(u==3&&j_zero)))))||temp_zero);

endmodule
