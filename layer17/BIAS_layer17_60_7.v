module BIAS_layer17_60_7 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000000101110100010))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000000110111101000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000001001100011100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b000000111100101000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b111110100101001100))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b000000011000001000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b000001000000100010))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000000000100000110))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b111110111110110000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000000100101101100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000010000100010010))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000011110011010))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000000101110100100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000000110011101110))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000001010011000000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000000011101010110))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
