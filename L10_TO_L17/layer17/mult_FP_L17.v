module mult_FP_L17 #(parameter frac_in=14,frac_out=16,int_out=1)(a, b,out,U);
localparam size_out=frac_out+int_out+1;
localparam frac_out_U5_U0=frac_out-1, int_out_U5_U0=int_out+1;
	input 	wire signed [15:0] a;
	input    wire signed	[15:0] b;
	input 	wire 			[2:0]  U;
	output   wire signed	[size_out-1:0] out;
	
wire sign,zero_flag;
wire [31:0] frac_temp;
//wire [size_out-1:0] out_temp;
//wire [size_out-1:0] out_temp;
assign frac_temp=a*b;
assign sign= zero_flag&&(a[15]^b[15]);
assign zero_flag=(|a[14:0])&&(|b[14:0]);
//assign out_temp= U==5||U==0 ? {sign,frac_temp[(frac_in*2-1)+int_out_U5_U0:(frac_in*2-1)+int_out_U5_U0-(size_out-2)]} :{sign,frac_temp[(frac_in*2-1)+int_out:(frac_in*2-1)+int_out-(size_out-2)]};
assign out=(!(|a[frac_in-1:0])||!(b[frac_in-1:0])) ? 18'b0 :
			U==5||U==0 ?  {sign,frac_temp[(frac_in*2-1)+int_out_U5_U0:(frac_in*2-1)+int_out_U5_U0-(size_out-2)]} :
			{sign,frac_temp[(frac_in*2-1)+int_out:(frac_in*2-1)+int_out-(size_out-2)]};

endmodule