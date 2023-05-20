module Z_count_L8(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero);
input L_zero,rst,clk,j_zero,k_zero,temp_zero;
input wire [2:0] u;
output reg  [1:0] z;
output wire z_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		else if(((L_zero||u==2)&&(z==3||(z==1&&(u==0 ||(k_zero)||(u==3&&j_zero)))||u==1))||temp_zero)
			z<=0;
		else if((L_zero||u==2)&&((j_zero)||(k_zero)||(u!=2&&u!=3)))
			begin z<=z+2'b1;  end
	end
assign z_zero=(((L_zero||u==2)&&(z==3||(z==1&&(u==0 ||(k_zero)||(u==3&&j_zero)))||u==1))||temp_zero);

endmodule
