module mux_weight_5_1_L8  #(parameter N_weight_out=256)(weight_out_conv14,weight_out_conv15,weight_out_conv16,weight_out_conv17,weight_out_conv18,u,weight_out);

input [N_weight_out*16-1:0] weight_out_conv14,weight_out_conv15,weight_out_conv16,weight_out_conv17,weight_out_conv18;
input   [2:0]u;
output reg  [N_weight_out*16-1:0] weight_out;

always@(*)
begin
    case(u)
    3'b000:  weight_out=weight_out_conv14;
    3'b001:  weight_out=weight_out_conv15;
    3'b010:  weight_out=weight_out_conv16;
    3'b011:  weight_out=weight_out_conv17;
    3'b100:  weight_out=weight_out_conv18;
	 default: weight_out=0;
    endcase
end
endmodule
