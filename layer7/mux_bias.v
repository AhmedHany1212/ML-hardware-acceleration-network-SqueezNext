module mux_bias_L7(in0,in1, sig,out);
input [16*18-1:0] in0,in1;
input  sig;
output reg [16*18-1:0]  out;
 
always@(*)
begin
    case(sig)
    1'b1:  out=in0;
    1'b0:  out=in1;
    
    endcase
end
endmodule