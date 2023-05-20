module adder_tree3in_L1
 #(parameter N=3)
 (
 input	wire 			   clk,rst,
 input 	wire 	    [16*N-1:0] A,
 input  wire 		[16*N-1:0] B,
 input  wire signed [17:0] bias,
 input  wire 			   load_sig,
 output wire signed [15:0] out
 );
 wire signed [17:0] G_reg,out_tree,out_Acu,input_Acu,out_relu;
 wire [18*N-1:0] F,F_reg;
 
genvar i;

 generate
   for ( i=0 ; i< N ; i = i + 1 )
  begin
       mult_FP	#(.frac_in(13),.frac_out(16),.int_out(1))mult_layer(.A(A[16*(i+1)-1:16*i]),.B(B[16*(i+1)-1:16*i]),.out(F[18*(i+1)-1:18*i]));
  end
 endgenerate
 
 generate
   for ( i=0 ; i< N ; i = i + 1 )
  begin
       Reg_AT 	R_stage1(.D(F[18*(i+1)-1:18*i]),.clk(clk),.rst(rst),.Q(F_reg[18*(i+1)-1:18*i]));
  end
 endgenerate
 
 adder_3in_FP add1(.a(F_reg[18*(0+1)-1:18*0]),.b(F_reg[18*(1+1)-1:18*1]),.c(F_reg[18*(2+1)-1:18*2]),.out(G_reg));
 Reg_AT 	  R_stage2(.D(G_reg),.clk(clk),.rst(rst),.Q(out_tree));
 
 accumlator_3in acu(.in(out_tree),.bias(bias),.ld(load_sig),.clk(clk),.rst(rst),.out(out_Acu));
 
 relu Relu(.in(out_Acu),.out(out_relu));
 assign out = out_relu[17:2];
endmodule

