module Reg_AT_u_L2(
 input	wire 	 	 D,
 input	wire			 clk,rst,
 output reg 	 	 Q
 );

 always @(posedge clk or negedge rst)
  begin
   if (!rst)
   	Q<=1'b0;
   else 
   	Q<=D;
  end		
endmodule

