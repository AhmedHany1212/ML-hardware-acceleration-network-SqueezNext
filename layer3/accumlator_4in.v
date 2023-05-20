module accumlator_4in(
 input	wire 	[17:0] 	 in1,in2,bias,
 input	wire			 ld,
 input	wire			 clk,rst,
 output reg 	[17:0] 	 out
 );
 //reg [17:0] out_reg; 
 always @(posedge clk or negedge rst)
  begin
   if (!rst)
	out<=0; 
   else if(ld)
    out<=bias+in1+in2;
   else
    out<=in1+in2+out;
  end	
	//assign out = out_reg;	  
endmodule

