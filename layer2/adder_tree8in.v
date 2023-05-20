module adder_tree8in 
#(parameter N=8)
 (
  input	 wire 			   clk,rst,
  input  wire 	    [16*N-1:0] A,
  input  wire 		[16*N-1:0] B,
  input  wire signed [17:0] bias,
  input  wire 		load_sig,
  output wire signed [15:0] out
 );
 wire signed [17:0] out_Acu,out_relu,Y,Y_reg;
 wire [18*3-1:0] G,G_reg;
 wire [18*N-1:0] F,F_reg;

 genvar i;
 
 generate
   for ( i=0 ; i< N ; i = i + 1 )
  begin
	    mult_FP	#(.frac_in(14),.frac_out(16),.int_out(1))mult_layer(.A(A[16*(i+1)-1:16*i]),.B(B[16*(i+1)-1:16*i]),.out(F[18*(i+1)-1:18*i]));
  end
 endgenerate


 generate
   for ( i=0 ; i< N ; i = i + 1 )
  begin
       Reg_AT 	R_layer1(.D(F[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(F_reg[18*(i+1)-1:18*i]));
  end
 endgenerate
 
 

adder_3in_FP add_1 (
	   .a(F_reg[18*(0+1)-1:18*0]),
	   .b(F_reg[18*(1+1)-1:18*1]),
	   .c(F_reg[18*(2+1)-1:18*2]),
	   .out(G[18*(0+1)-1:0*18])
	   );
adder_3in_FP add_2 (
	   .a(F_reg[18*(3+1)-1:18*3]),
	   .b(F_reg[18*(4+1)-1:18*4]),
	   .c(F_reg[18*(5+1)-1:18*5]),
	   .out(G[18*(1+1)-1:1*18])
	   );
adder_2in_FP add_3 (
	   .a(F_reg[18*(6+1)-1:18*6]),
	   .b(F_reg[18*(7+1)-1:18*7]),
	   .out(G[18*(2+1)-1:2*18])
	   );


 generate
   for ( i=0 ; i< 3 ; i = i + 1 )
  begin
       Reg_AT 	R_layer2(.D(G[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(G_reg[18*(i+1)-1:18*i]));
  end
 endgenerate

adder_3in_FP add1_2 (
	   .a(G_reg[18*(0+1)-1:18*0]),
	   .b(G_reg[18*(1+1)-1:18*1]),
	   .c(G_reg[18*(2+1)-1:18*2]),
	   .out(Y)
	   );
 Reg_AT R_layer3(.D(Y),.clk(clk),.rst(rst),.Q(Y_reg));


 accumlator_L5 acu(.in(Y_reg),.bias(bias),.ld(load_sig),.clk(clk),.rst(rst),.out(out_Acu));
 relu Relu(.in(out_Acu),.out(out_relu));
 assign out = out_relu[17:2];
endmodule
