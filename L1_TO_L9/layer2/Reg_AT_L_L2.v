module Reg_AT_L_L2(
 input	wire 	[2:0] 	 D,
 input	wire			 clk,rst,
 output reg 	[2:0] 	 Q
 );

 always @(posedge clk or negedge rst)
  begin
   if (!rst)
   	Q<=3'b000;
   else 
   	Q<=D;
  end		
endmodule

