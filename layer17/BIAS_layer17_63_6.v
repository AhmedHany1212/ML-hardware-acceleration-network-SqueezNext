module BIAS_layer17_63_6 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000001100001000000))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b111111011011111100))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b111101000001111100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b111101110011000100))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000000110100111000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111111001100010100))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111101001101001000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b111110001110111100))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000010100010011000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000000111010110100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b111110001101101100))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000000011111100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000000001000010000))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000000101101011000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000000101010010000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b111111011010111100))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
