//we have 16 bias each one has need 1 num so they need 16 num at time (16*16 bits)
module BIAS_layer5_2 #(parameter N_adder_tree=8)(q);
output wire [N_adder_tree*18-1:0] q;

BIAS #(.value(18'b000001011011101100)) U0 (.q(q[18*(0+1)-1:18*0])); 
BIAS #(.value(18'b000010010011110000)) U1 (.q(q[18*(1+1)-1:18*1])); 
BIAS #(.value(18'b111110100100000000)) U2 (.q(q[18*(2+1)-1:18*2])); 
BIAS #(.value(18'b000101110110011100)) U3 (.q(q[18*(3+1)-1:18*3])); 
BIAS #(.value(18'b111110110110011100)) U4 (.q(q[18*(4+1)-1:18*4])); 
BIAS #(.value(18'b111111000100000100)) U5 (.q(q[18*(5+1)-1:18*5])); 
BIAS #(.value(18'b000000011010100000)) U6 (.q(q[18*(6+1)-1:18*6])); 
BIAS #(.value(18'b111110111001111100)) U7 (.q(q[18*(7+1)-1:18*7])); 
endmodule

