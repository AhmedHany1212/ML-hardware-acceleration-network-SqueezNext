module mux2_1_Layer_3(in1,in2,sel,out_b);
input [18*4-1:0]        in1,in2;
input                   sel;
output reg [18*4-1:0]   out_b;

always@(*)
	begin
	  case(sel)
	    1'b0:out_b=in1;
		1'b1:out_b=in2;
	  endcase
	end
endmodule