module BIAS_layer16_55_4 #(parameter N_adder_tree=16)(q);
output wire [N_adder_tree*18-1:0] q;


BIAS #(.value(18'b111100101010111000))  U0 (.q(q[18*(0+1)-1:18*0]));
BIAS #(.value(18'b000010000010100000))  U1 (.q(q[18*(1+1)-1:18*1]));
BIAS #(.value(18'b110110011011111000))  U2 (.q(q[18*(2+1)-1:18*2]));
BIAS #(.value(18'b001000010100100000))  U3 (.q(q[18*(3+1)-1:18*3]));
BIAS #(.value(18'b000110110001110100))  U4 (.q(q[18*(4+1)-1:18*4]));
BIAS #(.value(18'b000010011000100100))  U5 (.q(q[18*(5+1)-1:18*5]));
BIAS #(.value(18'b000100101100010100))  U6 (.q(q[18*(6+1)-1:18*6]));
BIAS #(.value(18'b000010101010001000))  U7 (.q(q[18*(7+1)-1:18*7]));
BIAS #(.value(18'b000011011010111000))  U8 (.q(q[18*(8+1)-1:18*8]));
BIAS #(.value(18'b000001101011101000))  U9 (.q(q[18*(9+1)-1:18*9]));
BIAS #(.value(18'b111011000110110100))  U10 (.q(q[18*(10+1)-1:18*10]));
BIAS #(.value(18'b000000101110010100))  U11 (.q(q[18*(11+1)-1:18*11]));
BIAS #(.value(18'b111100110100010100))  U12 (.q(q[18*(12+1)-1:18*12]));
BIAS #(.value(18'b111100111111100100))  U13 (.q(q[18*(13+1)-1:18*13]));
BIAS #(.value(18'b111111110011010100))  U14 (.q(q[18*(14+1)-1:18*14]));
BIAS #(.value(18'b111101010001001100))  U15 (.q(q[18*(15+1)-1:18*15]));


endmodule