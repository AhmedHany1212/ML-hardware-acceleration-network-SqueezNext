module M_A_T16x16_L17#(parameter N_adder_tree=16)(BRAM_out,clk,rst,weight_out,bias,load,BRAM2_in,IN_SKIP,U,u_Reg1);

 input  wire [N_adder_tree*16-1:0]   BRAM_out,IN_SKIP;
 input wire [2:0] U,u_Reg1;
 input  wire 	clk,rst;
 input  wire [N_adder_tree*16*16-1:0] weight_out;
 input  wire [N_adder_tree*18-1:0]   bias;
 input  wire 	load;
 output wire [N_adder_tree*16-1:0]   BRAM2_in;
 
 
 genvar i;
 generate
   for ( i=0 ; i< N_adder_tree ; i = i + 1 )
  begin
       adder_tree16in_L17 AT(
	   .clk(clk),
	   .rst(rst),
	   .A(BRAM_out),
	   .B(weight_out[(i+1)*16*16-1:i*16*16]),
	   .bias(bias[(i+1)*18-1:i*18]),
	   .load_sig(load),
	   .out(BRAM2_in[(i+1)*16-1:i*16]),
		.IN_SKIP(IN_SKIP[(i+1)*16-1:i*16]),
		.U(U),
		.u_Reg1(u_Reg1)
		);
  end
 endgenerate
 
endmodule