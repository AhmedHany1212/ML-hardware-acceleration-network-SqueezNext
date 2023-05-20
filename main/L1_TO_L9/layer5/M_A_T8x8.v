module M_A_T8x8 #(parameter M=8)(data_in,clk,rst,weight,bias,load,out_filter);
 
 input  wire [8*16-1:0]   data_in;
 input  wire 			  clk,rst;
 input  wire [M*8*16-1:0] weight;
 input  wire [M*18-1:0]   bias;
 input  wire 			  load;
 output wire [M*16-1:0]   out_filter;

 
 genvar i;
 generate
   for ( i=0 ; i< M ; i = i + 1 )
  begin
       adder_tree8in AT(
	   .clk(clk),
	   .rst(rst),
	   .A(data_in),
	   .B(weight[(i+1)*8*16-1:i*8*16]),
	   .bias(bias[(i+1)*18-1:i*18]),
	   .load_sig(load),
	   .out(out_filter[(i+1)*16-1:i*16]));
  end
 endgenerate
 
endmodule