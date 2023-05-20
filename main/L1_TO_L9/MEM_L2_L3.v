module MEM_L2_L3 #(parameter N_BRAM_L2_L3=16,BRAM2_adder_width=10)(BRAM2_addr_L2,BRAM1_addr_L3,clk,BRAM2_out,W_En,R_En,BRAM3_in);
input 	clk,W_En,R_En;
input  	[(BRAM2_adder_width-1):0] 	BRAM2_addr_L2,BRAM1_addr_L3;
input 	[N_BRAM_L2_L3*16-1:0]  			BRAM2_out;
output  	[N_BRAM_L2_L3*16-1:0]       	BRAM3_in;

genvar i;
generate
  for ( i=0 ; i< N_BRAM_L2_L3 ; i = i + 1 )
  begin
       MEM_TRANS MEM_TRANS (
	   .BRAM2_addr_L1(BRAM2_addr_L2),
		.BRAM1_addr_L2(BRAM1_addr_L3),
	   .clk(clk),
		.W_En(W_En),
		.R_En(R_En),
		.out(BRAM3_in[(i+1)*16-1:i*16]),
	   .in(BRAM2_out[(i+1)*16-1:i*16]));  //[16-1:0] // [32-1:16]
  end
endgenerate

endmodule 
