//we need R_counter to count 4 times(from 1 to 4) with each (k=2)and(j=2) then back to 0 and so on

/*how to calculate R ?
we will say A=(1+Lmax)  * (1+Jmax) * (1+Kmax)ot multiplication of them 
we will say B=(1+number of stages of adder tree)
R(first time) =0->B (at all cases) but we need to calculater R in all times expect first time
then if A>=B:
R(all times expect first time)=0->B
then if B>A:
R(all times expect first time)=0->B-A
number of stages of adder tree= 4 at 3 or 4 ch
number of stages of adder tree= 5 at 8 or 16 ch
*/
module R_count_L1 (R_zero,clk,rst,k_zero,temp_zero);
output wire R_zero;
input clk,rst,k_zero,temp_zero;
reg [2:0] R;
always @ (posedge clk or negedge rst)
	begin
		if (! rst ) begin
			R<=0;  end
		else if (temp_zero)begin
			R<=3'b1; end
		else if(R[2])begin
			R<=0; end
		else if ((R[0]||R[1])||k_zero)
			R<=R+3'b1;
	end
assign R_zero=R[2];

endmodule