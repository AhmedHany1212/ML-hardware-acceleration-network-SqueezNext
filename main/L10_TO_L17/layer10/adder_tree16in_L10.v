module adder_tree16in_L10_L16 #(parameter N=16) (clk,rst,A,B,bias,load_sig,out,U,IN_SKIP);
input	 wire 			   clk,rst;
input  wire 	    [16*N-1:0] A;
input  wire 		[16*N-1:0] B;
input  wire signed [17:0] bias;
input  wire 			   load_sig;
output wire signed [15:0] out;
input wire signed [15:0] IN_SKIP;
input wire [2:0] U;
wire signed [17:0] out_Acu;
wire [18*2-1:0] Y,Y_reg;
wire [18*6-1:0] G_reg; 
wire [18*5-1:0] G;
wire [18*N-1:0] F,F_reg;
wire signed [17:0] out_relu;
genvar i;

 generate
   for ( i=0 ; i< N ; i = i + 1 )
	  begin
			 mult_FP	mult_layer(.A(A[16*(i+1)-1:16*i]),.B(B[16*(i+1)-1:16*i]),.out(F[18*(i+1)-1:18*i]));
	  end
 endgenerate

 generate
   for ( i=0 ; i< N ; i = i + 1 )
	  begin
			 Reg_AT 	R_layer2(.D(F[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(F_reg[18*(i+1)-1:18*i]));
	  end
 endgenerate
 
 
  generate
   for ( i=0 ; i< N-1 ; i = i + 3 )
  begin
       adder_3in_FP add1(
	   .a(F_reg[18*(i+1)-1:18*i]),
	   .b(F_reg[18*(i+2)-1:18*(i+1)]),
	   .c(F_reg[18*(i+3)-1:18*(i+2)]),
	   .out(G[(i/3+1)*18-1:(i/3)*18])
	   );
  end
 endgenerate

  generate
   for ( i=0 ; i< 5 ; i = i + 1 )
  begin
		Reg_AT 	R_layer3(.D(G[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(G_reg[18*(i+1)-1:18*i]));
  end
 endgenerate
 
 Reg_AT 	R(.D(F_reg[18*N-1:18*(N-1)]),.clk(clk),.rst(rst),.Q(G_reg[18*6-1:18*5]));

  generate
   for ( i=0 ; i< 6 ; i = i + 3 )
  begin
       adder_3in_FP add2(
	   .a(G_reg[18*(i+1)-1:18*i]),
	   .b(G_reg[18*(i+2)-1:18*(i+1)]),
	   .c(G_reg[18*(i+3)-1:18*(i+2)]),
	   .out(Y[(i/3+1)*18-1:(i/3)*18])
	   );
  end
 endgenerate
 
  generate
   for ( i=0 ; i< 2 ; i = i + 1 )
  begin
		Reg_AT 	R_layer4(.D(Y[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(Y_reg[18*(i+1)-1:18*i]));
  end
 endgenerate
 
 
 accumlator acu(.in1(Y_reg[17:0]),.in2(Y_reg[35:18]),.bias(bias),.ld(load_sig),.clk(clk),.rst(rst),.out(out_Acu));
 
 relu Relu(.in(out_Acu),.out(out_relu));
 assign out = (U==4) ? out_relu[17:2]+ IN_SKIP : out_relu[17:2];
 
endmodule