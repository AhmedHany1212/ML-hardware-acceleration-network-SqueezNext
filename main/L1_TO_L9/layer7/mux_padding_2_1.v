module mux_padding_2_1_L7  #(parameter N_adder_tree=16)(BRAM_out,sel,BRAM_out_without_padding);
output reg  [N_adder_tree*16-1:0] BRAM_out;
input  wire [N_adder_tree*16-1:0] BRAM_out_without_padding;
input  wire sel;

always@(*)
	case(sel)
		1'b1: BRAM_out=0;
		1'b0: BRAM_out=BRAM_out_without_padding;
	endcase
	
endmodule
