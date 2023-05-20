module BIAS_layer17_60_3 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000001110011001010))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000000010001001000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000000011100010000))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b000000101011000000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000001101010100000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111111001001111000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b000000001100010110))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000001110010111100))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b111111011010011110))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b111111111110111000))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b111111011110110100))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000100100110110))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000000001111100100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000010101100001110))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b111110010111000010))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000001101111000110))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
