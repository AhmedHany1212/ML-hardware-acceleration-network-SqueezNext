module Reg_AT(
 input	wire 	[17:0] 	 D,
 input	wire			 clk,rst,
 output reg 	[17:0] 	 Q
 );

 always @(posedge clk or negedge rst)
  begin
   if (!rst)
   	Q<=0;
   else 
   	Q<=D;
  end		
endmodule

