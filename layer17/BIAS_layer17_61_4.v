module BIAS_layer17_61_4 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000011101011000100))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b111100110111010000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000001011101011000))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b111110011010100100))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000001110101110000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111101010101110100))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111101101011001100))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000000111010100000))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000000101011110100))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000001111000011100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000011010011000000))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000100100110001100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000011000011100100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000010010010001000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000100000111110100))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b111111101011000000))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
