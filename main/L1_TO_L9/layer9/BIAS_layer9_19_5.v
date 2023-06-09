module BIAS_layer9_19_5 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b000111000001111000))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b111111101011111000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b000011111000111000))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b111111000110011000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000000001000010100))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b111111100010100100))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b111101000001000000))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000000110011011100))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b111101010100101000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b111111101100110100))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b000011100101010100))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b110100111100111100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b000100101001010100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b000110010010101000))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b000001001010010000))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b000000000001110100))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule
