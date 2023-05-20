module MEM_L7_skip #(parameter N_adder_tree=16,addr_width=10)(BRAM2_addr,clk,BRAM2_in,wr,BRAM2_out);
input clk,wr;
input  [(addr_width-1):0] BRAM2_addr;
input [N_adder_tree*16-1:0]  BRAM2_in;
output  [N_adder_tree*16-1:0]       BRAM2_out;

 genvar i;
 generate
   for ( i=0 ; i< N_adder_tree ; i = i + 1 )
  begin
       MEM_skip_L7 MEM_skip (
	   .BRAM2_addr(BRAM2_addr),
	   .clk(clk),
		.wr(wr),
		.out(BRAM2_out[(i+1)*16-1:i*16]),
	   .q(BRAM2_in[(i+1)*16-1:i*16]));  
  end
 endgenerate

endmodule
