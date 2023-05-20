module BIAS_layer17_65_14 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000000011000001110))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000000001111101110))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b111111101110010100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b111111010110111010))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b111111101000101000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111111010101100000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b000000100100011110))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000000101001111010))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000000000101110110))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b111111010001001000))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000000011100110000))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000001000000110))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000000010000100000))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b111111000101110000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b111111100101100110))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b111110110101100110))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
