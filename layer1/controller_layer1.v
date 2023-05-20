//we need j_counter to count 3 times(from 0 to 2(Ph-1)) with each posedge clk then back to 0 and so on
//we need k_counter to count 3 times(from 0 to 2(Pw-1)) with each (j=2) then back to 0 and so on
//we need y_counter to count 30 times(from 0 to 29(Hout-1)) with each (k=2)and(j=2) then back to 0 and so on
//we need x_counter to count 30 times(from 0 to 29(Wout-1)) with each (y=29)and(k=2)and(j=2)  then back to 0 and so on
//we need temp_counter  to count 4 times(from 1 to 4(same as R all)) with each (x=29)and(y=29)and(k=2)and(j=2) then back to 0 and so on
//we need R_counter to count 4 times(from 1 to 4) with each (k=2)and(j=2) then back to 0 and so on
/*how to calculate R ?
we will say A=(1+Lmax)  * (1+Jmax) * (1+Kmax)ot multiplication of them 
we will say B=(1+number of stages of adder tree)
R(first time) =0->B (at all cases) but we need to calculate R in all times expect first time
then if A>=B:
R(all times expect first time)=0->B
then if B>A:
R(all times expect first time)=0->B-A
number of stages of adder tree= 4 at 3 or 4 ch
number of stages of adder tree= 5 at 8 or 16 ch
*/
//BRAM1_addr will be x+k row and y+j column to be like 0 1 2 32 33 34 64 65 66 

//BRAM2_addr will be x row and y column but will be shifted by REG to have correct address
//weight_addr will be k row and j column 

module controller_layer1(BRAM1_addr,BRAM2_addr,weight_addr,load,clk,rst,temp_zero,temp_zero_new);
input wire clk,rst;
output wire [9:0] BRAM1_addr,BRAM2_addr;
output wire [3:0] weight_addr;
output wire 		load,temp_zero,temp_zero_new;
wire [4:0] x,y;
wire [1:0] j,k;
wire [4:0] row,col;
wire j_zero,k_zero,y_zero,x_zero,temp_count;

j_count_L1 j_counter_layer_1 		(j,j_zero,clk,rst,temp_zero);
k_count_L1 k_counter_layer_1 		(k,k_zero,clk,rst,j_zero,temp_zero);
y_count_L1 y_counter_layer_1 		(y,y_zero,clk,rst,k_zero,temp_count,temp_zero);
x_count_L1 x_counter_layer_1 		(x,x_zero,clk,rst,y_zero,temp_count,temp_zero);
temp_count_L1 temp_counter_layer_1(temp_count,temp_zero,clk,rst,x_zero,temp_zero_new);
R_count_L1 R_count_L1				(R_zero,clk,rst,k_zero,temp_zero);
BRAM2_out_L1 BRAM2_out 				(BRAM2_addr,clk,rst,k_zero,x,y);
assign load=R_zero;
assign weight_addr={k,j};
assign row=x+k;
assign col=y+j;
assign BRAM1_addr = {row,col};
//assign padding = temp_5;

endmodule