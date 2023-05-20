
module in_skip_address(in_skip_L6,depth_mem_out,in_skip);
 input [2:0] 	   depth_mem_out;
 input  [16*16-1:0] in_skip_L6;
output reg [4*16-1:0]   in_skip;              

 always @(*)
 begin
 case (depth_mem_out)
	 3'b001:  in_skip = in_skip_L6[(3+1)*16-1:0*16];
	 3'b010:  in_skip = in_skip_L6[(7+1)*16-1:4*16];
	  3'b011:  in_skip = in_skip_L6[(11+1)*16-1:8*16];
	  3'b000:  in_skip = in_skip_L6[(15+1)*16-1:12*16]; 
	  3'b101:		in_skip = in_skip_L6[(3+1)*16-1:0*16];
	 3'b110:     in_skip = in_skip_L6[(7+1)*16-1:4*16];
	 3'b111:     in_skip = in_skip_L6[(11+1)*16-1:8*16];
	 3'b100:     in_skip = in_skip_L6[(15+1)*16-1:12*16];
	 
endcase
 end

endmodule
