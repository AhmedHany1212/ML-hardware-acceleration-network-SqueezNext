module adder_tree4in_L6 
 #(parameter N=4)
 (
  input	 wire 			   	    clk,rst,
  input  wire 	     [16*N-1:0] A,
  input  wire 		 [16*N-1:0] B,
  input  wire signed [17:0]     bias,
  input  wire 			        load_sig,
  input wire [16-1:0] in_skip,
  output wire signed [15:0]     out
 );
 wire signed [17:0] out_Acu;
 wire        [17:0] G;
 wire signed [17:0] out_relu;
 wire  [18*2-1:0] G_reg; 
 
 wire [18*N-1:0] F,F_reg;

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
       Reg_AT 	R_layer1(.D(F[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(F_reg[18*(i+1)-1:18*i]));
  end
 endgenerate


 adder_3in_FP add1 (F_reg[18*(0+1)-1:18*0],F_reg[18*(1+1)-1:18*1],F_reg[18*(2+1)-1:18*2],G);

 Reg_AT R_layer2_1 (.D(G),.clk(clk),.rst(rst),.Q(G_reg[18*(0+1)-1:18*0]));
 Reg_AT R_layer1_2 (.D(F_reg[18*(3+1)-1:18*3]),.clk(clk),.rst(rst),.Q(G_reg[18*(1+1)-1:18*1]));


 accumlator_4in acu(.in1(G_reg[17:0]),.in2(G_reg[35:18]),.bias(bias),.ld(load_sig),.clk(clk),.rst(rst),.out(out_Acu));
 relu Relu(.in(out_Acu),.out(out_relu));
 assign out = out_relu[17:2] + in_skip;

endmodule