module mux2_1 #(parameter data_width=8,parameter data_size=18)(in1,in2,sel,out_b);
input [data_size*data_width-1:0]        in1,in2;
input                   sel;
output reg [data_size*data_width-1:0]   out_b;

always@(*)
	begin
	  case(sel)
	    1'b0:out_b=in1;
		 1'b1:out_b=in2;
	  endcase
	end
endmodule