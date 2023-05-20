module mux_input_2_1_L8  #(parameter N_adder_tree=16)(BRAM_out,BRAM_out_Mem1,BRAM_out_Mem2,u);

  output reg  [N_adder_tree*16-1:0] BRAM_out;
  input  [N_adder_tree*16-1:0] BRAM_out_Mem1,BRAM_out_Mem2;
  input [2:0] u;

always@(*)

	case(u==1||u==3)
		1'b1: BRAM_out=BRAM_out_Mem2;
		1'b0: BRAM_out=BRAM_out_Mem1;
	endcase	
endmodule
