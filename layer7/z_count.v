module Z_count_L7(z,z_zero,u,L_zero,j_zero,k_zero,clk,rst,temp_zero,u_1_2);
input L_zero,rst,clk,j_zero,k_zero,temp_zero;
input wire [2:0] u;
output reg  [1:0] z;
output reg u_1_2;
output wire z_zero;
always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin z<=0; end
		
		else if(((L_zero||u==3)&&(z==3||(z==1&&(u==1 ||(k_zero)||(u==4&&j_zero)))||u==2))||temp_zero)
			begin 
				z<=0;

			end		
		else if((L_zero||u==3)&&((j_zero)||(k_zero)||(u!=3&&u!=4)))
			begin z<=z+2'b1;  end
	end
assign z_zero=((L_zero||u==3)&&(z==3||(z==1&&(u==1||(k_zero)||(u==4&&j_zero)))||u==2))||temp_zero;

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
