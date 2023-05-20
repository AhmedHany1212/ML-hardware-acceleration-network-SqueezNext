module BIAS_layer9_19_4 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b111110111001110100))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000001011110000000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b111001011111111100))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b111101100000110100))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000100000011001100))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b000000011110101000))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111110000110101000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b111011101101110000))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000000001011100000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000010110011110100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000000100110111000))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000001000011110000))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000011001110001000))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000010110000011100))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b111111110101111000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000011011001100000))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
