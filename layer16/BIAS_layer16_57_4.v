module BIAS_layer16_57_4 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b111111001111010100))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000001110110100000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000000111101101100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b000000001011010000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000001001011001000))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111110110100111000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b000000011001011000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000001100010111100))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b111110001011010000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b111111011101100100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000000011111110000))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000001000111110100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b111111010010110100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000001011000110000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b111111000011111100))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000000101011010000))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
