module MUX_weight_6X1_L17  #(parameter N_weight_out=256)(weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13,u,weight_out);

input [N_weight_out*16-1:0] weight_out_conv8,weight_out_conv9,weight_out_conv10,weight_out_conv11,weight_out_conv12,weight_out_conv13;
input   [2:0]u;
output reg  [N_weight_out*16-1:0] weight_out;

always@(*)
begin
    case(u)
    3'b000:  weight_out=weight_out_conv8;
    3'b001:  weight_out=weight_out_conv9;
    3'b010:  weight_out=weight_out_conv10;
    3'b011:  weight_out=weight_out_conv11;
    3'b100:  weight_out=weight_out_conv12;
    3'b101:  weight_out=weight_out_conv13;
	 default: weight_out=0;
    endcase
end
endmodule
