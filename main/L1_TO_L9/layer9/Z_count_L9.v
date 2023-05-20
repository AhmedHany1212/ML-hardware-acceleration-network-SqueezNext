module Z_count_L9(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero,u_1_2);
input L_zero,rst,clk,j_zero,k_zero,temp_zero;
input wire [2:0] u;
output reg  [2:0] z;
output wire z_zero;
output reg u_1_2;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0;  end
		else if(((L_zero)&&(z==7||(z==3&&(u==1||(u==3&&k_zero)||(u==4&&j_zero)))||(z==1&&(u==2 ))))||temp_zero)
			z<=0;
		else if((L_zero)&&((j_zero)||(k_zero)||(u!=4&&u!=3)))
			begin z<=z+2'b1;  end
	end
assign z_zero=(((L_zero)&&(z==7||(z==3&&(u==1||(u==3&&k_zero)||(u==4&&j_zero)))||(z==1&&(u==2 ))))||temp_zero);

always @ (*)
	begin
		if (u==1&&z_zero)
			u_1_2=1'b0;
		else if (u==0&&z_zero||u==1)
			u_1_2=1'b1;
		else 	
			u_1_2=1'b0;
	end
endmodule
