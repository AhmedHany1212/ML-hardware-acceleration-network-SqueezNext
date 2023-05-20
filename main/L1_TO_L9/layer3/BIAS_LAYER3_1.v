module BIAS_layer3_1 #(parameter N_adder_tree=4)(q);
output wire [N_adder_tree*18-1:0] q;



BIAS #(.value(18'b111110110100111000)) U0 (.q(q[18*(0+1)-1:18*0])); 
BIAS #(.value(18'b111111111111010100)) U1 (.q(q[18*(1+1)-1:18*1])); 
BIAS #(.value(18'b111010010110110100)) U2 (.q(q[18*(2+1)-1:18*2])); 
BIAS #(.value(18'b000011110111100100)) U3 (.q(q[18*(3+1)-1:18*3])); 
 


endmodule
