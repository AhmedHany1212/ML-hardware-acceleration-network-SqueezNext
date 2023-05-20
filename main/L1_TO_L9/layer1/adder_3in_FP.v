module adder_3in_FP(
 input 	signed  [17:0] a,b,c,
 output signed 	[17:0] out
 );

assign out=a+b+c;
endmodule