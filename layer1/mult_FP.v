module mult_FP #(parameter frac_in=14,frac_out=16,int_out=1)(A, B,out);
localparam size_out=frac_out+int_out+1;
	input 	wire signed [15:0] A;
	input    wire signed	[15:0] B;
	output   wire signed	[size_out-1:0] out;
	
wire sign,zero_flag;
wire [31:0] frac_temp;
//wire [size_out-1:0] out_temp;
assign frac_temp=A*B;
assign sign= zero_flag&&(A[15]^B[15]);
assign zero_flag=(|A[14:0])&&(|B[14:0]);
//assign out_temp = (sign&&!|frac_temp[(frac_in*2-1)+int_out:(frac_in*2-1)+int_out-(size_out-2)]) ? 0 : {sign,frac_temp[(frac_in*2-1)+int_out:(frac_in*2-1)+int_out-(size_out-2)]};
assign out=(!(|A[frac_in-1:0])||!(B[frac_in-1:0])) ? 18'b0 :{sign,frac_temp[(frac_in*2-1)+int_out:(frac_in*2-1)+int_out-(size_out-2)]};

endmodule