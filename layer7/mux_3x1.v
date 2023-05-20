module mux_input_3_1_L7  #(parameter N_adder_tree=16)(BRAM_out,BRAM_out_Mem1,BRAM_out_Mem2,BRAM_out_TRANS,u);

  output reg  [N_adder_tree*16-1:0] BRAM_out;
  input  [N_adder_tree*16-1:0] BRAM_out_Mem1,BRAM_out_Mem2,BRAM_out_TRANS;
  input [2:0] u;

always@(*)

	case(u)
		0: BRAM_out=BRAM_out_TRANS;
		1: BRAM_out=BRAM_out_TRANS;
		2: BRAM_out=BRAM_out_Mem2;
		3: BRAM_out=BRAM_out_Mem1;
		4: BRAM_out=BRAM_out_Mem2;
		5: BRAM_out=BRAM_out_Mem1;		
		default:	BRAM_out=0;
	endcase	
endmodule
