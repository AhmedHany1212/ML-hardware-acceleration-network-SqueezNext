module accumlator_L5(in,bias,ld,clk,rst, out);
input	wire signed [17:0] in,bias;
input	wire	ld;
input	wire	 clk,rst;
output reg signed [17:0] out;

 always @(posedge clk or negedge rst)
  begin
   if (!rst)
	out<=0; 
   else if(ld)
    //out_reg<=bias+in;
	 out<=bias+in;
   else
   // out_reg<=in+out_reg;	
	out<=in+out;	
  end
//  	assign out = out_reg;	
endmodule