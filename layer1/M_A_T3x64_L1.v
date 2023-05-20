//we have 64 adder trees all of them have the same 3 inputs from BRAM_out so its size 3 numbers
//we have 64 adder trees each one has different 3 inputs from weight_out so its size 3 *64 numbers
//we have 64 adder trees each one has different 1 bias from bias so its size  64 numbers
//we have 64 adder trees each one has different 1 output to BRAM2_in so its size  64 numbers
//we have 64 adder trees all of them have the same load which restart the accumlator and add bias and first 3 num in it

module M_A_T3x64_L1 #(parameter N_adder_tree=64) (BRAM_out,weight_out,bias,load,BRAM2_in,clk,rst);

input  wire [3*16-1:0]   BRAM_out;
input  wire 			  clk,rst;
input  wire [N_adder_tree*3*16-1:0] weight_out;
input  wire [N_adder_tree*18-1:0]   bias;
input  wire 			  load;
output wire [N_adder_tree*16-1:0]   BRAM2_in;

 
 genvar i;
 generate
   for ( i=0 ; i< N_adder_tree ; i = i + 1 )
  begin
       adder_tree3in_L1 AT(
	   .clk(clk),
	   .rst(rst),
	   .A(BRAM_out),
	   .B(weight_out[(i+1)*3*16-1:i*3*16]),
	   .bias(bias[(i+1)*18-1:i*18]),
	   .load_sig(load),
	   .out(BRAM2_in[(i+1)*16-1:i*16]));
  end
 endgenerate
 
endmodule