module MUX_padding_2X1  #(parameter M=8)(BRAM_out,sel,BRAM_out_without_padding);
output reg  [M*16-1:0] BRAM_out;
input  wire [M*16-1:0] BRAM_out_without_padding;
input  wire sel;

always@(*)
	case(sel)
		1'b1: BRAM_out=0;
		1'b0: BRAM_out=BRAM_out_without_padding;
	endcase
	
endmodule
