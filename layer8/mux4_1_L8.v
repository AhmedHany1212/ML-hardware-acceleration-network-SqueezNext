module mux4_1_L8(in0,in1,in2,in3, sig,out);
input [16*18-1:0] in0,in1,in2,in3;
input [1:0] sig;
output reg [16*18-1:0]  out;

always@(*)
begin
    case(sig)
    2'b00:  out=in0;
    2'b01:  out=in1;
    2'b10:  out=in2;
    2'b11:  out=in3;
    endcase
end
endmodule