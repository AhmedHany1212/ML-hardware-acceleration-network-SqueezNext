module BIAS_layer14_48_3 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000000101100011100))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b111110111101110100))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000001010000111100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b000001110011011000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000000001100000000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111110000101010000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111110110011001000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000000101100001000))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b111111001011100000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000010011000010000))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000001001100010000))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000010100000100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000001010111110100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000010000100011000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000000011110100000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b111110000110110100))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
