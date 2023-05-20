module M_A_T4x8_L4
 #(parameter M=8)
 (
 input  wire [4*16-1:0]    data_in,
 input  wire 			      clk,rst,
 input  wire [M*4*16-1:0]  weight,
 input  wire [M*18-1:0]    bias,
 input  wire 		    	   load,
 output wire [M*16-1:0]    out_filter
 );
 
 genvar i;
 generate
   for ( i=0 ; i< M ; i = i + 1 )
  begin
       adder_tree4in_L4 AT(
	   .clk(clk),
	   .rst(rst),
	   .A(data_in),
	   .B(weight[(i+1)*4*16-1:i*4*16]),
	   .bias(bias[(i+1)*18-1:i*18]),
	   .load_sig(load),
	   .out(out_filter [(i+1)*16-1:i*16]));
  end
 endgenerate
 
endmodule