module mux_bias_5_1_L8  #(parameter N_bias_out=16)(bias_out_conv14,bias_out_conv15,bias_out_conv16,bias_out_conv17,bias_out_conv18,u,bias_out);

input [N_bias_out*18-1:0] bias_out_conv14,bias_out_conv15,bias_out_conv16,bias_out_conv17,bias_out_conv18;
input   [2:0]u;
output reg  [N_bias_out*18-1:0] bias_out;

always@(*)
begin
    case(u)
    3'b000:  bias_out=bias_out_conv14;
    3'b001:  bias_out=bias_out_conv15;
    3'b010:  bias_out=bias_out_conv16;
    3'b011:  bias_out=bias_out_conv17;
    3'b100:  bias_out=bias_out_conv18;
	 default: bias_out=0;
    endcase
end
endmodule