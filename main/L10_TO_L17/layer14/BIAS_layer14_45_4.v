module BIAS_layer14_45_4 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000001100100111000))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000010001100101000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b111111001111110100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b000011011111010000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b111110101011000100))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b000001001101000000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111011110101111000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000010000010101100))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000001101111001100))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b111101100011111100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b111110010101011100))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b111110010100111100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000110111101110000))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000001000001100000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000000010000000000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000000110100010000))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule