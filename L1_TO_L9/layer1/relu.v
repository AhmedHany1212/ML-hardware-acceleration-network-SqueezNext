module relu(in,out);
input wire [17:0] in;
output wire [17:0] out;

wire sel=in[17];

assign out = !(sel) ? in : 18'b0;


endmodule
