module mux4_1_Layer_3 (in1,in2,in3,in4,sel,out_b);
input [16*4-1:0] in1,in2,in3,in4;
input [1:0]      sel;
output reg [16*4-1:0] out_b;

always@(*)
	begin
	  case(sel)
	    1:out_b=in1;
		2:out_b=in2;
		3:out_b=in3;
		0:out_b=in4;
	  endcase
	end
endmodule