
//we have 16 bias each one has need 1 num so they need 16 num at time (16*16 bits)
module BIAS_layer5 #(parameter N_adder_tree=8)(q);
output wire [N_adder_tree*18-1:0] q;

BIAS #(.value(18'b111111011001000000)) U0 (.q(q[18*(0+1)-1:18*0])); 
BIAS #(.value(18'b111111110000001000)) U1 (.q(q[18*(1+1)-1:18*1])); 
BIAS #(.value(18'b000000101000000000)) U2 (.q(q[18*(2+1)-1:18*2])); 
BIAS #(.value(18'b111110100110111000)) U3 (.q(q[18*(3+1)-1:18*3])); 
BIAS #(.value(18'b111111100101001000)) U4 (.q(q[18*(4+1)-1:18*4])); 
BIAS #(.value(18'b000111111001001000)) U5 (.q(q[18*(5+1)-1:18*5])); 
BIAS #(.value(18'b000001001001111000)) U6 (.q(q[18*(6+1)-1:18*6])); 
BIAS #(.value(18'b111111110111100100)) U7 (.q(q[18*(7+1)-1:18*7])); 
endmodule
